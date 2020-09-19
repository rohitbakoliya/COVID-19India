import 'package:covid_19/constant.dart';
import 'package:covid_19/screens/district_wise_data.dart';
import 'package:flutter/material.dart';

class CreateTable extends StatefulWidget {
  final List<dynamic> data;
  const CreateTable({Key key, this.data}) : super(key: key);
  @override
  _CreateTableState createState() => _CreateTableState();
}

class _CreateTableState extends State<CreateTable> {
  List<DataRow> rows = [];
  bool _sort;
  int _columnIndex;
  @override
  void initState() {
    rows = getRows();
    _sort = true;
    _columnIndex = 1;
    super.initState();
  }
  List<DataRow> getRows(){
    List<DataRow> rows = [];
    this.widget.data.forEach((value){
      if(value['confirmed']!="0"){
      rows.add(
        DataRow(
          cells: [
            DataCell(
              Container(
                width: 90,
                child: Text(
                  value['state'],
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Color(0xFF4B4B4B),
                    fontWeight: value['state'] == "Total" ? FontWeight.bold : FontWeight.normal,
                    fontFamily: "Poppins"
                  ),
                ),
              ),
              onTap: (){
                if(value['state']!="Total"){
                  Navigator.push(context , MaterialPageRoute(builder: (context){return DistrictWiseData(state : value['state']);}));
                }
              }
            ),
            DataCell(
            Text(
                value['confirmed'],
                style: TextStyle(
                  color: kInfectedColor,
                  fontWeight: value['state'] == "Total" ? FontWeight.bold : FontWeight.normal,
                  fontFamily: "Poppins",
                ),
              )
            ),
            DataCell(
              Text(
                value['recovered'],
                style: TextStyle(
                  color: kRecovercolor,
                  fontWeight: value['state'] == "Total" ? FontWeight.bold : FontWeight.normal,
                  fontFamily: "Poppins"
                ),
              ),
            ),
            DataCell(
              Text(
                value['deaths'],
                style: TextStyle(
                  color: kDeathColor,
                  fontWeight: value['state'] == "Total" ? FontWeight.bold : FontWeight.normal,
                  fontFamily: "Poppins"
                ),
              ),
            ),
          ],
        )
      );
      }
    });
    return rows;
  }

  onSortColumn(int columnIndex,bool ascending, String type){
    if(ascending){
      this.widget.data.sort((a, b){
        if(b["state"] == "Total" && b["state"] == "Total") return 0;
        if(a["state"] == "Total") return 1;
        if(b["state"] == "Total") return -1;

        if(type !="state")
          return int.parse(a[type]).compareTo(int.parse(b[type]));
        else
          return a[type].compareTo(b[type]); 
      });
    }
    else{
      this.widget.data.sort((a, b){
        if(b["state"] == "Total" && b["state"] == "Total") return 0;
        if(a["state"] == "Total") return 1;
        if(b["state"] == "Total") return -1;
        if(type !="state")
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
  return DataTable(
        sortAscending: _sort,
        sortColumnIndex: _columnIndex,
        dataRowHeight: 60,
        // columnSpacing: 0,
        // horizontalMargin: 15,
        columns: [
        DataColumn(
          label: Text(
            'State',
            style: TextStyle(
              color: Color(0xFF4B4B4B),
              fontWeight: FontWeight.bold,
              fontFamily: "Poppins"
            ),
          ),
          onSort: (columnIndex, ascending){
              setState(() {
                _sort  = !_sort;
                _columnIndex = columnIndex;
              });
              onSortColumn(columnIndex, ascending, "state");
          },
          
        ),
        DataColumn(
          label: Text(
            'Infected',
            style: TextStyle(
              color: kInfectedColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins"
            ),
          ),
          numeric: true,
          onSort: (columnIndex, ascending){
              setState(() {
                _sort  = !_sort;
                _columnIndex = columnIndex;
              });
              onSortColumn(columnIndex, ascending, "confirmed");
          },
        ),
        DataColumn(
          label: Text(
            'Recovered',
            style: TextStyle(
              color: kRecovercolor,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600
            ),
          ),
          numeric: true,
          onSort: (columnIndex, ascending){
              setState(() {
                _sort  = !_sort;
                _columnIndex = columnIndex;
              });
              onSortColumn(columnIndex, ascending, "recovered");
          },
        ),
        DataColumn(
          label: Text(
            'Deaths',
            style: TextStyle(
              color: kDeathColor,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600
            ),
          ),
          numeric: true,
          onSort: (columnIndex, ascending){
              setState(() {
                _sort  = !_sort;
                _columnIndex = columnIndex;
              });
              onSortColumn(columnIndex, ascending, "deaths");
          },
        )
      ],
      rows: rows,
      );
  }
}


//   rows: this.widget.data.map<DataRow>((value){
      //     return new DataRow(
      //       cells: [
      //         DataCell(
      //           Container(
      //             width: 90,
      //             child: Text(
      //               value['state'],
      //               maxLines: 2,
      //               overflow: TextOverflow.ellipsis,
      //               style: TextStyle(
      //                 color: Color(0xFF4B4B4B),
      //                 fontWeight: value['state'] == "Total" ? FontWeight.bold : FontWeight.normal,
      //                 fontFamily: "Poppins"
      //               ),
      //             ),
      //           ),
      //           onTap: (){
      //             if(value['state']!="Total"){
      //               Navigator.push(context , MaterialPageRoute(builder: (context){return DistrictWiseData(state : value['state']);}));
      //             }
      //           }
      //         ),
      //         DataCell(
      //         Text(
      //             value['confirmed'],
      //             style: TextStyle(
      //               color: kInfectedColor,
      //               fontWeight: value['state'] == "Total" ? FontWeight.bold : FontWeight.normal,
      //               fontFamily: "Poppins",
      //             ),
      //           )
      //         ),
      //         DataCell(
      //           Text(
      //             value['recovered'],
      //             style: TextStyle(
      //               color: kRecovercolor,
      //               fontWeight: value['state'] == "Total" ? FontWeight.bold : FontWeight.normal,
      //               fontFamily: "Poppins"
      //             ),
      //           ),
      //         ),
      //         DataCell(
      //           Text(
      //             value['deaths'],
      //             style: TextStyle(
      //               color: kDeathColor,
      //               fontWeight: value['state'] == "Total" ? FontWeight.bold : FontWeight.normal,
      //               fontFamily: "Poppins"
      //             ),
      //           ),
      //         ),
      //       ],
      //     );}
      //   ).toList(),