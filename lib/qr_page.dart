import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'book_ticket_page.dart';
import 'home_page.dart';
import 'trip_data.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text("TICKET QR", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Center(
        child: TripData.ticketId.isEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Your QR will appear here after booking."),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookTicketPage()),
                );
              },
              child:  Text("Book a Ticket",style: TextStyle(fontWeight: FontWeight.w600,)),
            ),
          ],
        )
            : QrImageView(
          data: TripData.ticketId,
          version: QrVersions.auto,
          size: 250.0,
          errorCorrectionLevel: QrErrorCorrectLevel.H,
        ),
      ),
    );
  }
}