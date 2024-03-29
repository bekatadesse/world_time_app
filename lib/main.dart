import 'package:flutter/material.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
import 'package:world_time_app/pages/choose_location.dart';

void main() {
  runApp(MaterialApp(
    //home: Home(),
    initialRoute: '/',

    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/choose_location': (context) => ChooseLocation(),
    },
  ));
}
