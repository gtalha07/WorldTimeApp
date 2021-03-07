import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String url;
  String flag;
  String time;
  bool isDayTime;
  WorldTime({this.location,this.flag,this.url});
  Future<void> getTime() async{
    Response response = await get('https://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours:int.parse(offset)));
    time = now.toString();
    isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
    time = DateFormat.jm().format(now);


  }
}
