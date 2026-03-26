import 'package:flutter/material.dart';
import 'package:metrogo/home_screen.dart';
import 'package:metrogo/map.dart';
import 'package:metrogo/profile_page.dart';

import 'qr_page.dart';
import 'ticket_history.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homescreen(),
    MapPage(),
    TicketHistory(),
    QrPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: Color(0xffd7deff),
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Color(0xff202020),
      type: BottomNavigationBarType.fixed,

      currentIndex: _currentIndex,

      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },

      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.alt_route), label: "Routes"),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_number),
          label: "Tickets",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Ticket QR"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
