import 'dart:convert';
import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';

class DistrictWiseData extends StatefulWidget {
  final String state;
  const DistrictWiseData({Key key, this.state}) : super(key: key);
  @override
  _DistrictWiseDataState createState() => _DistrictWiseDataState();
}

class _DistrictWiseDataState extends State<DistrictWiseData> {
  
  List<dynamic> disData = [];
  List<DataRow> rows = [];
  bool loading = true;
  bool _sort;
  int _columnIndex;
  @override
  void initState() {
    _sort = true;
    _columnIndex = 1;
    super.initState();
    getData();
  }
onSortColumn(int columnIndex,bool ascending, String type){
    if(ascending){
      disData.sort((a, b){
        if(type !="district")
          return int.parse(a[type]).compareTo(int.parse(b[type]));
        else
          return a[type].compareTo(b[type]); 
      });
    }
    else{
      disData.sort((a, b){
        
        if(type !="district")
          return int.parse(b[type]).compareTo(int.parse(a[type]));
        else
          return b[type].compareTo(a[type]); 
      });    
    }
    setState(() {
      rows = getRows();
    });
  
  }
  @override
  Widget build(BuildContext context) {
    //Note: without providing type it is not working 
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: AppDrawer(),
      appBar: AppBar(
        leading: IconButton(
         icon: Icon(Icons.arrow_back_ios),
         onPressed: (){
           Navigator.pop(context);
         },
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F)
              ],
            )
          )
        ),
        // backgroundColor: Color(0xFF11249F).withOpacity(0.80),
        elevation: 0.0,
        actions: <Widget>[
          /*
            Note the 'Builder' is necessary so that the IconButton gets the context
            underneath the Scaffold. Without that, it would instead be using the
            context of the App and therefore wouldn't be able to find the Scaffold.
          */
          Builder(
            builder: (context)=>Tooltip(
                  message: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: GestureDetector(
                  child: Container(
                    // decoration: BoxDecoration(color: Colors.brown),
                    padding: EdgeInsets.all(15),
                    child: SvgPicture.asset('assets/icons/menu.svg')
                  ),
                  onTap: (){
                    _scaffoldKey.currentState.openEndDrawer();
                  },
                ),
              ),
            ),
          )
        ],
      ),
        body: SingleChildScrollView(
          child: loading == true ? SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Loading...',
                  style: TextStyle(color : kBodyTextColor.withOpacity(0.80)),
                ),
              ),
            ): 
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
              sortAscending: _sort,
              sortColumnIndex: _columnIndex,
              dataRowHeight: 60,
              // columnSpacing: 0,
              // horizontalMargin: 20,
              columns: [
                DataColumn(
                  label: Text(
                    'District',
                  style: TextStyle(
                    color: kBodyTextColor,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins"
                    ),
                  ),
                  onSort: (columnIndex, ascending){
                    setState(() {
                      _sort  = !_sort;
                      _columnIndex = columnIndex;
                    });
                    onSortColumn(columnIndex, ascending, "district");
                  },
                ),
                DataColumn(
                  numeric: true,
                    label: Text(
                      'Infected',
                      style: TextStyle(
                          color: kInfectedColor,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins"),
                    ),
                    onSort: (columnIndex, ascending){
                      setState(() {
                        _sort  = !_sort;
                        _columnIndex = columnIndex;
                      });
                      onSortColumn(columnIndex, ascending, "confirmed");
                    },
                  ),
                DataColumn(
                  numeric: true,
                    label: Text(
                  'Recovered',
                  style: TextStyle(
                      color: kRecovercolor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                  ),
                  onSort: (columnIndex, ascending){
                    setState(() {
                      _sort  = !_sort;
                      _columnIndex = columnIndex;
                    });
                    onSortColumn(columnIndex, ascending, "recovered");
                  },
                ),
                DataColumn(
                  numeric: true,
                    label: Text(
                  'Deaths',
                  style: TextStyle(
                      color: kDeathColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600),
                  ),
                  onSort: (columnIndex, ascending){
                    setState(() {
                      _sort  = !_sort;
                      _columnIndex = columnIndex;
                    });
                    onSortColumn(columnIndex, ascending, "deceased");
                  },
                ),
              ],
              rows: rows,
          ),
            ),
        ),
    );
  }

  Future<void> getData() async {
    try {
      Response response =
          await get('https://api.covid19india.org/state_district_wise.json');
      Map data = jsonDecode(response.body);
      Map districts = data[this.widget.state]['districtData'];
      districts.forEach((key, value) {
        Map<String, String> mp = {
          'district': key,
          'confirmed': "${value['confirmed']}",
          'recovered' : "${value['recovered']}",
          'deceased' : "${value['deceased']}"
        };
        disData.add(mp);
      });
      setState(() {
        rows = getRows();
      });
      setState(() {
        loading = false;
      });
    } catch (e) {
      print('error is: ' + e.toString());
    }
  }
  List<DataRow> getRows(){
    List<DataRow> _rows = [];
    disData.forEach((value) {
      _rows.add(
          DataRow(
            cells: [
              DataCell(
                Container(
                  width: MediaQuery.of(context).size.width/4.0,
                  child: Text(
                    '${value['district']}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: kBodyTextColor,
                      fontFamily: "Poppins"
                    ),
                  ),
                ),
              ),
              DataCell(
                Text(
                  '${value['confirmed']}',
                  style: TextStyle(
                    color : kInfectedColor,
                    fontFamily: "Poppins"
                  )
                )
              ),
              DataCell(
                Text(
                  '${value['recovered']}',
                  style: TextStyle(
                    color : kRecovercolor,
                    fontFamily: "Poppins"
                  )
                )
              ),
              DataCell(
                Text(
                  '${value['deceased']}',
                  style: TextStyle(
                    color : kDeathColor,
                    fontFamily: "Poppins"
                  )
                )
              )
            ],
          )
        );
    });
    return _rows;
  }
}
