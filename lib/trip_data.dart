import 'package:uuid/uuid.dart';

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

  static String paymentMethod() {
    if (paymentIndex == -1) return '';
    return paymentMethods[paymentIndex];
  }

}