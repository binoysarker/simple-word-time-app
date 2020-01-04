import 'package:flutter/material.dart';
import 'package:flutter_app/services/word_time_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<String> allTimeZones = [];

  void getTimeZones() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      this.allTimeZones = sharedPreferences.getStringList('all_time_zones');
    });
  }

  @override
  void initState() {
    super.initState();
    this.getTimeZones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text('Choose Location'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () async{
                  WorldTimeService worldTimeService = new WorldTimeService(timeZone: this.allTimeZones[index]);
                  await worldTimeService.getTime();
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  preferences.setString('timeZone', worldTimeService.timeZone);
                  preferences.setString('time', worldTimeService.time);
                  preferences.setBool('isDayTime', worldTimeService.isDayTime);
                  Navigator.pushNamed(context, '/world-time');
                },
                title: Text('${this.allTimeZones[index]}'),
              ),
            );
          },
          itemCount: this.allTimeZones.length,
        ),
      ),
    );
  }
}
