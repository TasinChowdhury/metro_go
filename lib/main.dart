import 'package:flutter/material.dart';
//import 'package:metrogo/signin_screen.dart';
import 'package:metrogo/signup.dart';
import 'package:metrogo/fare_calculator.dart';
import 'package:metrogo/travel_schedule.dart';
import 'package:metrogo/signin_screen.dart';



import 'home_page.dart';
import 'splash_screen.dart';
import 'book_ticket_page.dart';
//import 'package:metrogo/signup.dart';
//import 'home_page.dart';
//import 'splash_screen.dart';
//import 'book_ticket_page.dart';
import "Edit profile.dart";






void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //initialRoute: 'splash_screen',
      //home: HomePage(),

     // initialRoute: 'home_page',
      //initialRoute: 'signin_screen',
     // initialRoute: 'SignUp'
      //initialRoute: 'home_page',
     // initialRoute: 'signin_screen',
     // initialRoute: 'SignUp',
      initialRoute: 'edit',

     // initialRoute: 'fare_calculator',

      //initialRoute: 'book_ticket_page',
    // initialRoute: 'travel',

      routes: {
        //'splash_screen': (context) => SplashScreen(),

        //'signin_screen': (context) => SigninScreen(),
       // 'SignUp': (context) =>  SignupPage(),
      // 'travel': (context) =>  TravelSchedule(),

        //'home_page': (context) => HomePage(),
       // 'fare_calculator': (context) => Fare_calculator(),
       // 'book_ticket_page': (context) => BookTicketPage(),

       // 'signin_screen': (context) => SigninScreen(),
      //  'SignUp': (context) => SignupPage(),
        'edit': (context) =>  EditProfilePage(),
        //'home_page': (context) => HomePage(),
       // 'fare_calculator': (context) => fare_calculator(),
        //'book_ticket_page': (context) => BookTicketPage(),



      },
    );
  }
}