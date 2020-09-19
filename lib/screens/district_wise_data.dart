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
  Map data = {};
  Map districts = {};
  List<DataRow> rows = [];
  bool loading = true;
  @override
  void initState() {
    super.initState();
    getData();
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
            ): DataTable(
            columnSpacing: 0,
            dataRowHeight: 60,
            horizontalMargin: 20,
            columns: [
              DataColumn(
                label: Text(
                  'District',
                style: TextStyle(
                  color: kBodyTextColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Poppins"),
              )),
              DataColumn(
                numeric: true,
                  label: Text(
                    'Infected',
                    style: TextStyle(
                        color: kInfectedColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Poppins"),
                  ),
                ),
              DataColumn(
                numeric: true,
                  label: Text(
                'Recovered',
                style: TextStyle(
                    color: kRecovercolor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              )),
              DataColumn(
                numeric: true,
                  label: Text(
                'Deaths',
                style: TextStyle(
                    color: kDeathColor,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600),
              )),
            ],
            rows: rows,
          ),
        ),
    );
  }

  Future<void> getData() async {
    try {
      Response response =
          await get('https://api.covid19india.org/state_district_wise.json');
      data = jsonDecode(response.body);
      districts = data[this.widget.state]['districtData'];
      districts.forEach((key, value) {
        rows.add(
          DataRow(
            cells: [
              DataCell(
                Container(
                  width: MediaQuery.of(context).size.width/4.0,
                  child: Text(
                    key,
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
      setState(() {
        loading = false;
      });
    } catch (e) {
      print('error is: ' + e.toString());
    }
  }
}
