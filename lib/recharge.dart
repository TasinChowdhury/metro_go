import 'package:flutter/material.dart';
import 'package:metrogo/recharge_input.dart';
import 'card.dart';
import 'trip_data.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  int selectedIndex = -1;
  String? _amountError;
  final TextEditingController _amountController = TextEditingController();

  //final _formKey = GlobalKey<FormState>();
  String? validateRechargeAmount(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter amount';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (int.parse(value) <= 100) {
      return 'Amount must be greater than 100';
    }
    if (int.parse(value) >= 5000) {
      return 'Amount must be less than 5000';
    }
    return null;
  }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: Text(
          "CARD RECHARGE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          color: Colors.white,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => CardHomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recharge Amount',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _amountController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: '৳ Enter amount',
                      hintStyle: const TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      // no box border, blends with container
                      errorText: _amountError,
                    ),
                    onChanged: (value) {
                      // Save to TripData so recharge_input can access it
                      setState(() {
                        _amountError = null; // clear error while typing
                        TripData.card_recharge = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),

            Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 2),

            GestureDetector(
              onDoubleTap: () => setState(() => selectedIndex = 0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: selectedIndex == 0 ? Colors.black : Colors.white,
                    width: 12, // make it thicker
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/bkash.png',
                        height: 65,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 14),
                    Text(
                      'BKash',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: selectedIndex == 0 ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2),

            GestureDetector(
              onTap: () => setState(() => selectedIndex = 1),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: selectedIndex == 1 ? Colors.black : Colors.white,
                    width: 12, // make it thicker
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/rocket.png',
                        height: 65,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 14),
                    Text(
                      'Rocket',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: selectedIndex == 1 ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 2),

            GestureDetector(
              onTap: () => setState(() => selectedIndex = 2),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: selectedIndex == 2 ? Colors.black : Colors.white,
                    width: 12, // make it thicker
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/nagad.png',
                        height: 65,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 14),
                    Text(
                      'Nagad',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color: selectedIndex == 2 ? Colors.black : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  // Validate before opening bottom sheet
                  final error = validateRechargeAmount(_amountController.text);
                  if (error != null) {
                    setState(() => _amountError = error);
                    return;
                  }
                  if (selectedIndex == -1) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                          child: Text('Please select a payment method first!',
                              style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600)
                          ),
                        ),

                        backgroundColor: Colors.redAccent,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    TripData.paymentIndex = selectedIndex;
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      builder: (context) => RechargeInput(),
                    );
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pay Now',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    SizedBox(width: 8),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


