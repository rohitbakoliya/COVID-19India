
import 'dart:convert';

import 'package:http/http.dart';

class DataService{ 
  Future<Map> getData() async{
    Response response = await get("https://api.covid19india.org/data.json");
    final Map data =jsonDecode(response.body); 
    return data;
  }
}