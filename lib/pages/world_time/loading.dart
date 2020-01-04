import 'package:flutter/material.dart';
import 'package:flutter_app/services/word_time_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  void getTime() async {
    WorldTimeService worldTimeService =
        WorldTimeService(timeZone: 'Asia/Dhaka');
    await worldTimeService.getTime();
//    print(worldTimeService.time);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('timeZone', worldTimeService.timeZone);
    preferences.setString('time', worldTimeService.time);
    preferences.setBool('isDayTime', worldTimeService.isDayTime);

    // get all the timezones
    List<String> data = await worldTimeService.getAllTimezones();
    preferences.setStringList('all_time_zones', data);
    Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() {
    print('home page is loaded');
    super.initState();
    this.getTime();
  }

  @override
  Widget build(BuildContext context) {
    const spinkit = SpinKitCircle(
      color: Colors.white,
      size: 50.0,
    );
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
          child: Center(
        child: spinkit,
      )),
    );
  }
}
