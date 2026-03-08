import 'package:flutter/material.dart';


class Calculation extends StatefulWidget {

   String from;
   String to;
   int price;

   Calculation({
    super.key,
    required this.from,
    required this.to,
    required this.price,
  });

  @override
  State<Calculation> createState() => _CalculationState();
}

class _CalculationState extends State<Calculation> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Container(

          padding: EdgeInsets.all(25),
          margin: EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Text(
                "Ticket Price",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              Text(
                "The ticket price from ${widget.from} to ${widget.to} is:",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: 20),

              Text(
                "${widget.price} Tk",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 15),

              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Close"),
              )

            ],
          ),
        ),
      ),
    );
  }
}