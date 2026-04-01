import 'package:uuid/uuid.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripData {
  static String selectedFrom = '';
  static String selectedTo = '';
  static int passengerCount = 0;
  static int paymentIndex = -1;
  static int price = 0;
  static int card_recharge = 0;
  static const List<String> paymentMethods = ['BKash', 'Rocket', 'Nagad'];
  static String ticketId = '';

  static void generateTicketId() {
    ticketId = const Uuid().v4();
  }

  static Future<void> saveTicket() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    await FirebaseFirestore.instance.collection('tickets').doc(ticketId)
    //.set({'ticketId': ticketId}, SetOptions(merge: true));
    .set({
      'userId': userId, // ← so each user sees only their tickets
      'from': selectedFrom,
      'to': selectedTo,
      'passengers': passengerCount,
      'price': price,
      'paymentMethod': paymentMethod(),
      'isUsed': false,
      'purchasedAt': FieldValue.serverTimestamp(),
      'expiresAt': Timestamp.fromDate(DateTime.now().add(Duration(hours: 24))),
    });
  }

  static String paymentMethod() {
    if (paymentIndex == -1) return '';
    return paymentMethods[paymentIndex];
  }
}
