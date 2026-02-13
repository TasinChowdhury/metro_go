import 'package:flutter/material.dart';
//import 'package:metrogo/signin_screen.dart';
import 'package:metrogo/SignUp.dart';
import 'package:metrogo/fare_calculator.dart';




void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //initialRoute: 'signin_screen',
    //initialRoute: 'SignUp',
    initialRoute: 'fare_calculator',

    routes: {//'signin_screen':(context)=> SigninScreen(),
      //'SignUp': (context) => SignupPage(),
      'fare_calculator': (context) =>fare_calculator() ,


    },
  ));
}

