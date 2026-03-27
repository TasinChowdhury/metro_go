import 'package:flutter/material.dart';
import 'package:metrogo/recharge_complete.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'trip_data.dart';

class RechargeInput extends StatefulWidget {
  const RechargeInput({super.key});

  @override
  State<RechargeInput> createState() => _RechargeInputState();
}

class _RechargeInputState extends State<RechargeInput> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter phone number';
    }
    if (value.length < 11) {
      return 'Phone number must be at least 11 digits';
    }
    return null;
  }

  String? validatePin(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter PIN';
    }
    if (value.length < 4) {
      return 'PIN must be at least 4 digits';
    }
    return null;
  }

  Future<void> _doRecharge() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw Exception('Not logged in');

      // Update balance in Firestore by adding the recharge amount
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .set(
        {'balance': FieldValue.increment(TripData.card_recharge)},
        SetOptions(merge: true),
      );

      if (!mounted) return;

      // Close bottom sheet first, then go to success screen
      Navigator.of(context).pop();
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const RechargeComplete()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Recharge failed: $e')),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 35,
        right: 35,
        top: 40,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40,
      ),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 44,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(height: 16),

              // Shows the amount being recharged so user can confirm
              Text(
                'Paying ৳${TripData.card_recharge} via ${TripData.paymentMethod()}',
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20),
              //SizedBox(height: 30),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                validator: (value) => validatePhone(value),
              ),
              SizedBox(height: 25),

              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'PIN',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) => validatePin(value),
              ),
              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _doRecharge,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
