
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, String>> _buttons = [
    {'text': 'Quote List', 'link': '/quotes'},
    {'text': 'Ninja Id', 'link': '/ninja-id'},
    {'text': 'World Time', 'link': '/world-time'},
  ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _buttons.map((item) {
              return RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '${item['link']}');
                },
                child: Text('${item['text']}'),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
