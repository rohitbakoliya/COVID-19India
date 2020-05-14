import 'package:covid_19/constant.dart';
import 'package:covid_19/screens/district_wise_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget createTable(BuildContext context , Map data) {
  List<DataRow> rows = [];
  data['statewise'].forEach((value){
    if(value['confirmed']!="0"){
    rows.add(
      DataRow(
        cells: [
          DataCell(
            Text(
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
          DataCell(
            value['state'] == "Total" ? Container():
            Container(
              width: 30,
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){
                  Navigator.push(context , MaterialPageRoute(builder: (context){return DistrictWiseData(state : value['state']);}));
                },
                child: SvgPicture.asset("assets/icons/forward.svg"),
              ),
            )
          )
        ],
      )
    );
    }
  });
  var first = rows.first;
  rows.removeAt(0);
  rows.add(first);

  return DataTable(
      columnSpacing: 0,
      dataRowHeight: 60,
      horizontalMargin: 12,
      columns: [
      DataColumn(
        label: Text(
          'State',
          style: TextStyle(
            color: Color(0xFF4B4B4B),
            fontWeight: FontWeight.bold,
            fontFamily: "Poppins"
          ),
        )
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
        numeric: true
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
        numeric: true
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
        numeric: true
      ),
      DataColumn(
        label: Container(width: 30),
      )
    ],
    rows: rows,
  );
}