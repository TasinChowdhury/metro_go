import 'package:flutter/material.dart';
import 'package:metrogo/map.dart';

class TravelSchedule extends StatelessWidget {
  const TravelSchedule({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Travel Schedule",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),


      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height * 0.12,
        ),
        child: Column(
          children: [
            const SizedBox(height: 15),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 1.2),
                ),
                child: const Text(
                  'Key Schedule Details (Sunday-Thursday & Saturday):\n\n'
                      '• Operating Hours: 6:30 AM – 10:10 PM\n'
                      '• Peak Hours (6–10 min intervals): 6:30 AM – 11:00 AM & 4:00 PM – 10:10 PM\n'
                      '• Off-Peak Hours (12 min intervals): 11:01 AM – 4:00 PM\n'
                      '• Saturday Schedule: 6:30 AM – 10:10 PM (similar to weekdays, but less frequent off-peak)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 15),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 1.2),
                ),
                child: const Text(
                  'Friday Schedule:\n\n'
                      '• Service Time: 3:00 PM – 9:40 PM (No morning service)\n'
                      '• Frequency: Every 10 minutes.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 15),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey, width: 1.2),
                ),
                child: const Text(
                  'Operational Information:\n\n'
                      '• Single Journey Tickets: Counters close by 9:00 PM (or 7:45 PM for certain stations/trains).\n'
                      '• Weekly Holiday: Friday morning (full service starts in the afternoon).',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),




      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapPage(),
                ),
              );
            },
            child: const Text(
              "Map ->",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
