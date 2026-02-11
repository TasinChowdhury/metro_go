import 'package:flutter/material.dart';
import 'package:metrogo/signin_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'signin_screen',
    routes: {'signin_screen':(context)=> SigninScreen()},
  ));
}

