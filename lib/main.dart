import 'package:flutter/material.dart';
//import 'package:metrogo/signin_screen.dart';
import 'package:metrogo/SignUp.dart';




void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //initialRoute: 'signin_screen',
    initialRoute: 'SignUp',

    routes: {//'signin_screen':(context)=> SigninScreen(),
      'SignUp': (context) => SignupPage(),


    },
  ));
}

