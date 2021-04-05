import 'package:flutter/material.dart';
import 'package:uts/pages/home.dart';
import 'package:uts/pages/home2.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/home': (context) => Home(),
    },
  ));
}
