import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'book_ticket_page.dart';
import 'card.dart';
import 'fare_calculator.dart';
import 'ticket_history.dart';
import 'travel_schedule.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffe5e9f6), Color(0xfffdfdfd)],
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _header(),
             // const SizedBox(height: 18),
             // _currentStationCard(),
             // const SizedBox(height: 16),
             // _nextTrainsCard(),
              const SizedBox(height: 40),
              _featuresGrid(context),
              const SizedBox(height: 100),
              //_recentJourney(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    final user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? 'Traveller';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xfff4fbff),
              radius: 25,
              backgroundImage: AssetImage('assets/profile.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hey,",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                Text(
                  displayName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }


  Widget _featuresGrid(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _featureItem(Icons.calculate, "Fare\nCalculator", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => Fare_calculator()));
              }),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _featureItem(Icons.confirmation_number, "Ticket\nBooking", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => BookTicketPage()));
              }),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _featureItem(Icons.credit_card, "Metro\nCard", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => CardHomePage()));
              }),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _featureItem(Icons.schedule_outlined, "Travel\nSchedule", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TravelSchedule()));
              }),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Row(
          children: [
            Expanded(
              child: _featureItem(Icons.history, "Ticket\nHistory", () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => TicketHistory()));
              }),
            ),
            const SizedBox(width: 16),

            const Expanded(child: SizedBox()),
          ],
        ),
      ],
    );
  }

  Widget _featureItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        height: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(color: Colors.indigo, blurRadius: 6)],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 33, color: Colors.indigo),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
