import 'package:flutter/material.dart';

class NinjaIdPage extends StatefulWidget {
  @override
  _NinjaIdPageState createState() => _NinjaIdPageState();
}

class _NinjaIdPageState extends State<NinjaIdPage> {
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = TextStyle(
        fontFamily: 'IndieFlower',
        fontSize: 20.0,
        color: Colors.white,
        fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/img1.jpeg'),
                    radius: 50.0,
                  ),
                ),
                Text(
                  'Hello world',
                  style: _textStyle,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Current Ninja Lavel',
                  style: _textStyle,
                ),
                Text(
                  '$_counter',
                  style: _textStyle,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.email),
                    Text(
                      'test@gmail.com',
                      style: _textStyle,
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            this._counter ++;
          });
        },
        child: Text('click'),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}