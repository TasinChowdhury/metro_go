import 'package:flutter/material.dart';
import 'package:metrogo/fare_calculator.dart';
import 'book_ticket_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key : key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F6),
      bottomNavigationBar: _bottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _header(),
              const SizedBox(height: 16),

              _currentStationCard(),
              const SizedBox(height: 16),

              _nextTrainsCard(),
              const SizedBox(height: 24),

              _featuresGrid(context),
              const SizedBox(height: 24),

              _recentJourney(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage('assets/profile.png'), // optional
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Hey,",
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                Text(
                  "Kaniz Fatema",
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        )
      ],
    );
  }

  Widget _currentStationCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.indigo),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Current Station",
                        style: TextStyle(color: Colors.grey)),
                    Text("Uttara North",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Change"),
            )
          ],
        ),
      ),
    );
  }

  Widget _nextTrainsCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Next Trains",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Uttara North → Motijheel"),
                Text("09:55 am",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _timeChip("10:05 am"),
                const SizedBox(width: 8),
                _timeChip("10:15 am"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _timeChip(String time) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(time, style: const TextStyle(color: Colors.white)),
    );
  }

  Widget _featuresGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        _featureItem(Icons.calculate, "Fare\nCalculator", () {}),
        _featureItem(Icons.confirmation_number, "Ticket\nBooking", () {}),
        _featureItem(Icons.credit_card, "Metro\nCard", () {}),
        _featureItem(Icons.alt_route, "Train\nRoute", () {}),
        _featureItem(Icons.history, "Ticket\nHistory", () {}),
      ],
    );
  }

  Widget _featureItem(IconData icon, String title, VoidCallback onTap) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => fare_calculator(),
            ),
          );
    },
     // onTap: () {}
        child: Container(
        decoration: BoxDecoration(
        color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
    BoxShadow(
    color: Colors.indigo,
    blurRadius: 6,
    )
    ],
    ),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    Icon(icon, size: 28, color: Colors.indigo),
    const SizedBox(height: 8),
    Text(
    title,
    textAlign: TextAlign.center,
    style: const TextStyle(fontSize: 12),
    ),
    ],
    ),
    ),
    );
  }

  Widget _recentJourney() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Journey",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            leading: const Icon(Icons.train, color: Colors.indigo),
            title: const Text("Uttara North → Motijheel"),
            subtitle: const Text("Yesterday • 10:30 am"),
            trailing: const Text("৳360"),
          ),
        ),
      ],
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      selectedItemColor: Colors.indigo,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.alt_route), label: "Routes"),
        BottomNavigationBarItem(icon: Icon(Icons.confirmation_number), label: "Tickets"),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: "Card"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
