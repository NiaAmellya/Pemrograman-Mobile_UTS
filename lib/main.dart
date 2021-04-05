import 'package:flutter/material.dart';
import 'package:uts/pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      //'/item': (context) => ItemPage(),
    },
  ));
}
