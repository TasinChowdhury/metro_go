import 'package:flutter/material.dart';
import 'package:metrogo/home_screen.dart';
import 'package:metrogo/map.dart';
import 'package:metrogo/profile_page.dart';

import 'ticket_history.dart';
import 'card.dart';


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
     CardHomePage(),
     ProfilePage(),
  ];

  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     // Wrap the whole app in a Container for a full-screen background
  //     home: Container(
  //       decoration: const BoxDecoration(
  //         gradient: LinearGradient(
  //           // Define the starting and ending points for the gradient
  //           begin: Alignment.topLeft,
  //           end: Alignment.bottomRight,
  //           // Define the colors for the gradient
  //           colors: <Color>[
  //             Color(0xffe5e9f6), // Start color
  //             Color(0xfffdfdfd), // End color
  //           ],
  //         ),
  //       ),
  //
  //       child: Scaffold(
  //         backgroundColor: Colors.transparent,
  //         bottomNavigationBar: _bottomNavBar(),
  //         body: SafeArea(
  //           child: _pages[_currentIndex],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: _bottomNavBar(),
    );
  }
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //       // Wrap the whole app in a Container for a full-screen background
  //       home: Container(
  //           decoration: const BoxDecoration(
  //               gradient: LinearGradient(
  //                 // Define the starting and ending points for the gradient
  //                 begin: Alignment.topLeft, end: Alignment.bottomRight,
  //                   // Define the colors for the gradient
  //                   colors: <Color>[ Color(0xffe5e9f6), // Start color
  //                                    Color(0xfffdfdfd), // End color
  //                   ],
  //               ),
  //           ),
  //         child: Scaffold(
  //           backgroundColor: Colors.transparent,
  //           bottomNavigationBar: _bottomNavBar(),
  //           body:
  //           SafeArea(
  //             child: SingleChildScrollView(
  //               padding: const EdgeInsets.all(16),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   _header(), const SizedBox(height: 16),
  //                   _currentStationCard(), const SizedBox(height: 16),
  //                   _nextTrainsCard(), const SizedBox(height: 24),
  //                   _featuresGrid(context), const SizedBox(height: 24),
  //                   _recentJourney(),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //   );
  //}

  // Widget _header() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: [
  //       Row(
  //         children: [
  //           const CircleAvatar(
  //             backgroundColor: Color(0xfff4fbff),
  //             radius: 24,
  //             backgroundImage: AssetImage('assets/profile.png'),
  //           ),
  //           const SizedBox(width: 12),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: const [
  //               Text(
  //                 "Hey,",
  //                 style: TextStyle(fontSize: 14, color: Colors.grey),
  //               ),
  //               Text(
  //                 "Kaniz Fatema",
  //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //       // IconButton(
  //       //   onPressed: () {},
  //       //   icon: const Icon(Icons.notifications_none),
  //       // ),
  //     ],
  //   );
  // }
  //
  // Widget _currentStationCard() {
  //   return Card(
  //     color: Color(0xffd7deff),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Row(
  //             children: const [
  //               Icon(Icons.location_on, color: Colors.indigo),
  //               SizedBox(width: 8),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     "Current Station",
  //                     style: TextStyle(color: Colors.grey),
  //                   ),
  //                   Text(
  //                     "Uttara North",
  //                     style: TextStyle(
  //                       fontSize: 16,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           TextButton(
  //             onPressed: () {
  //               //Navigator.push(context, route)
  //             },
  //             child: const Text("Change"),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _nextTrainsCard() {
  //   return Card(
  //     color: Color(0xffd7deff),
  //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  //
  //     child: Padding(
  //       padding: const EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           const Text(
  //             "Next Trains",
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //           ),
  //           const SizedBox(height: 12),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: const [
  //               Text("Uttara North → Motijheel"),
  //               Text("09:55 am", style: TextStyle(fontWeight: FontWeight.bold)),
  //             ],
  //           ),
  //           const SizedBox(height: 12),
  //           Row(
  //             children: [
  //               _timeChip("10:05 am"),
  //               const SizedBox(width: 8),
  //               _timeChip("10:15 am"),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _timeChip(String time) {
  //   return Container(
  //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  //     decoration: BoxDecoration(
  //       color: Colors.indigo,
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Text(time, style: const TextStyle(color: Colors.white)),
  //   );
  // }
  //
  // Widget _featuresGrid(BuildContext context) {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     shrinkWrap: true,
  //     physics: const NeverScrollableScrollPhysics(),
  //     mainAxisSpacing: 16,
  //     crossAxisSpacing: 16,
  //     children: [
  //       _featureItem(Icons.calculate, "Fare\nCalculator", () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => Fare_calculator()),
  //         );
  //       }),
  //       _featureItem(Icons.confirmation_number, "Ticket\nBooking", () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => BookTicketPage()),
  //         );
  //       }),
  //       _featureItem(Icons.credit_card, "Metro\nCard", () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => CardHomePage()),
  //         );
  //       }),
  //       _featureItem(Icons.schedule_outlined, "Travel\nSchedule", () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => TravelSchedule()),
  //         );
  //       }),
  //       _featureItem(Icons.history, "Ticket\nHistory", () {
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => TicketHistory()),
  //         );
  //       }),
  //     ],
  //   );
  // }
  //
  // Widget _featureItem(IconData icon, String title, VoidCallback onTap) {
  //   return GestureDetector(
  //     onTap: onTap,
  //
  //     // onTap: () {}
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(16),
  //         boxShadow: [BoxShadow(color: Colors.indigo, blurRadius: 6)],
  //       ),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(icon, size: 28, color: Colors.indigo),
  //           const SizedBox(height: 8),
  //           Text(
  //             title,
  //             textAlign: TextAlign.center,
  //             style: const TextStyle(fontSize: 12),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  //
  // Widget _recentJourney() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       const Text(
  //         "Recent Journey",
  //         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //       ),
  //       const SizedBox(height: 12),
  //       Card(
  //         color: Color(0xffd7deff),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16),
  //         ),
  //         child: ListTile(
  //           leading: const Icon(Icons.train, color: Colors.indigo),
  //           title: const Text("Uttara North → Motijheel"),
  //           subtitle: const Text("Yesterday • 10:30 am"),
  //           trailing: const Text("৳360"),
  //         ),
  //       ),
  //     ],
  //   );
  // }

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
        // child: Row(
        //   children: [
        //     Expanded(
        //         child: IconButton(onPressed: () {nextPage(_HomePageState())},
        //             icon: Icon(Icons.home)) )
        //   ],
        // ),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.alt_route), label: "Routes"),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_number),
          label: "Tickets",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Card"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
