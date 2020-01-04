import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home_page.dart';
import 'package:flutter_app/pages/ninja_id.dart';
import 'package:flutter_app/pages/quote_list.dart';
import 'package:flutter_app/pages/world_time/choose_location.dart';
import 'package:flutter_app/pages/world_time/home.dart';
import 'package:flutter_app/pages/world_time/loading.dart';

void main() => runApp(MaterialApp(
    title: 'Practice App',
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LoadingPage(),
      '/home': (context) => HomePage(),
      '/ninja-id': (context) => NinjaIdPage(),
      '/quotes': (context) => QuoteListPage(),
      '/world-time': (context) => Home(),
      '/choose-location': (context) => ChooseLocation(),
},
    ));


