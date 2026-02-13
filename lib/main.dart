import 'package:flutter/material.dart';
//import 'package:metrogo/signin_screen.dart';
//import 'package:metrogo/SignUp.dart';
//import 'package:metrogo/fare_calculator.dart';

import 'book_ticket_page.dart';




void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    //initialRoute: 'signin_screen',
    //initialRoute: 'SignUp',
    //initialRoute: 'fare_calculator',
    initialRoute: 'book_ticket_page',

    routes: {//'signin_screen':(context)=> SigninScreen(),
      //'SignUp': (context) => SignupPage(),
      //'fare_calculator': (context) =>fare_calculator() ,
      'book_ticket_page': (context) =>BookTicketPage() ,

    },
  ));
}

