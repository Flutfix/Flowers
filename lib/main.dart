// import 'package:flowers/pages/flower_page/flower_page.dart';
import 'package:flowers/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: Flower(),
    home: Login(),
    theme: ThemeData(fontFamily: 'Exo2', canvasColor: Colors.transparent),
  ));
}
