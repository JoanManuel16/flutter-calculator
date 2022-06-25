import 'package:flutter/material.dart';
import 'package:calculadora/pages/home_page.dart';

class Claculadora extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Center(
          child: HomePage(),
        ));
  }
}
