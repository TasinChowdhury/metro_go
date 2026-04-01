import 'package:flutter/material.dart';
import 'package:metrogo/trip_data.dart';
import 'trip_summary_page.dart';

class PaymentCompletePage extends StatefulWidget {
  const PaymentCompletePage({super.key});

  @override
  State<PaymentCompletePage> createState() => _PaymentCompletePageState();
}

class _PaymentCompletePageState extends State<PaymentCompletePage> {
  @override
  // void initState() {
  //   super.initState();
  //
  //   TripData.generateTicketId();
  //   TripData.saveTicket();
  //   Future.delayed(Duration(seconds: 2), () {
  //     if (!mounted) return;
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => TripSummaryPage()),
  //     );
  //   });
  // }

  void initState() {
    super.initState();
    _saveAndNavigate(); // call our new async function
  }

  Future<void> _saveAndNavigate() async {
    TripData.generateTicketId(); // generate UUID first

    await TripData.saveTicket(); // WAIT until Firestore save is done

    // Only navigate after save is confirmed
    if (!mounted) return;
    Future.delayed(Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TripSummaryPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 35),
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 40),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 60),
              SizedBox(height: 16),
              Text(
                'Payment Complete!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
