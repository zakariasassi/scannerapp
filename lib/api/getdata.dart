

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constens.dart';



class Getdata {

  postData( Map data , String point) async {
    var  endPoint = baseURL+point;
    var response = await http.post(Uri.parse("http://192.168.1.4:3001/getdata") , body: data);
    if(response.statusCode == 200) {
      var responsbody = jsonDecode(response.body);
      return responsbody;
    }else{
      print(" Error ${response.statusCode}");
    }

  }
  getData( Map data , String point) async {
    var  endPoint = baseURL+point;
    var response = await http.get(Uri.parse(endPoint) );
    if(response.statusCode == 200) {
      var responsbody = jsonDecode(response.body);
      return responsbody;
    }else{
      print(" Error ${response.statusCode}");
    }

  }



}