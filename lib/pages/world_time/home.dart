import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map timeData = {};
  String bgImage;
  Color _bgColor;
  TextStyle textStyle = TextStyle(fontSize: 30.0);

  void getTimeData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      this.timeData['timeZone'] = sharedPreferences.getString('timeZone');
      this.timeData['time'] = sharedPreferences.getString('time');
      this.timeData['isDayTime'] = sharedPreferences.getBool('isDayTime');
      this.bgImage =
          this.timeData['isDayTime'] ? 'day-time.jpeg' : 'night-time.jpeg';
      this._bgColor =
          this.timeData['isDayTime'] ? Colors.blue[900] : Colors.black;
      this.textStyle = TextStyle(
          fontSize: 30.0,
          color: this.timeData['isDayTime'] ? Colors.black : Colors.white);
    });
  }

  @override
  void initState() {
    super.initState();
    this.getTimeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: this._bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/${this.bgImage}'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            FlatButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/choose-location');
                },
                icon: Icon(Icons.edit_location, color: Colors.grey[300],),
                label: Text('Edit location', style: TextStyle(color: Colors.grey[300]),)),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      '${this.timeData['timeZone']}',
                      style: textStyle,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '${this.timeData['time']}',
              style: textStyle,
            )
          ],
        ),
      )),
    );
  }
}
