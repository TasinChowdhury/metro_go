import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:metrogo/home_screen.dart';
import 'package:metrogo/signin_screen.dart';
import 'package:metrogo/signup.dart';
import 'package:metrogo/fare_calculator.dart';
import 'package:metrogo/travel_schedule.dart';

import 'home_page.dart';
import 'splash_screen.dart';
import 'book_ticket_page.dart';
import "Edit profile.dart";


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'splash_screen',
      home: HomePage(),

      routes: {
        'splash_screen': (context) => SplashScreen(),

        'signin_screen': (context) => SigninScreen(),
        'SignUp': (context) => SignupPage(),
        'travel': (context) => TravelSchedule(),
        'fare_calculator': (context) => Fare_calculator(),
        'edit': (context) => EditProfilePage(),
        'home_page': (context) => HomePage(),
        'home_screen': (context) => Homescreen(),
        'book_ticket_page': (context) => BookTicketPage(),
      },
    );
  }
}
