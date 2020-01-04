import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTimeService {
  String time;
  String flag;
  String url = 'https://worldtimeapi.org/api/timezone/';
  String timeZone = 'Asia/Dhaka';
  bool isDayTime = false;

  WorldTimeService({this.timeZone});

  Future<void> getTime() async{
    try {
      Response response = await get('$url$timeZone');
      // print(response.body.runtimeType);
      Map data = jsonDecode(response.body);
      // get properties from the data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'];
      // create a datetime object
      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offset.substring(0,3))));
//    print(now);
      this.isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      this.time = DateFormat.jm().format(now);
    } catch (error) {
      print('error $error');
      this.time = 'can not get the time';
    }


  }
  List<String> convertToMap(List data) {
    List<String> newData = [];
    data.forEach((item) {newData.add(item);});
    return newData;
  }
  Future<List<String>> getAllTimezones() async{
    Response response = await get('${this.url}');
    List data = jsonDecode(response.body);
    return convertToMap(data);
  }
}
