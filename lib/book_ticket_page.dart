import 'package:flutter/material.dart';
import 'home_page.dart';
import 'payment_page.dart';
import 'trip_data.dart';

class BookTicketPage extends StatefulWidget {
  const BookTicketPage({super.key});

  @override
  State<BookTicketPage> createState() => _BookTicketPageState();
}

class _BookTicketPageState extends State<BookTicketPage> {
  int passengerCount = 0;
  String? selectedFrom;
  String? selectedTo;
  String? selectedDay;
  String? selectedTime;

  final List<String> cities = [
    'Uttara North',
    'Uttara Center',
    'Uttara South',
    'Pallabi',
    'Mirpur10',
    'Mirpur11',
    'Kazipara',
    'Shewrapara',
    'Agargaon',
    'Bijoy Sarani',
    'Farmgate',
    'Karwan Bazar',
    'Shahbagh',
    'Dhaka University',
    'Secretariat',
    'Motijheel',
  ];
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  final List<String> times = [
    'Now',
    'Morning(06:30 AM -12 PM)',
    'Afternoon(12:00 PM - 4.30PM)',
    'Evening(4:30 PM -8:00 PM)',
    'Night(8:00 PM -10:10PM)',
  ];
  String getPassengerText() {
    if (passengerCount == 0) {
      return 'Passengers';
    } else if (passengerCount == 1) {
      return '1 Passenger';
    } else {
      return '$passengerCount Passengers';
    }
  }
  String? validateSelections() {
    if (selectedFrom == null) {
      return 'Please select departure city';
    }
    if (selectedTo == null) {
      return 'Please select destination city';
    }
    if (selectedFrom == selectedTo) {
      return 'Departure and destination cannot be same';
    }
    if (selectedDay == null) {
      return 'Please select a day';
    }
    if (selectedTime == null) {
      return 'Please select a time';
    }
    if (passengerCount == 0) {
      return 'Please add at least 1 passenger';
    }
    return null;
  }
  int price = 0;

  void calculatePrice() {
    if (selectedFrom == null || selectedTo == null) {
      return;
    }
    int f = cities.indexOf(selectedFrom!);
    int t = cities.indexOf(selectedTo!);
    int distance = (f - t).abs();
    price = distance * 20 * passengerCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        title: const Text("BOOKING TICKET"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomePage() ),
            );
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(300),
                  bottomRight: Radius.circular(300),
                ),
              ),
              child: Center(child: Image.asset('assets/train.png')),
            ),
            SizedBox(height: 24),
            Text(
              'Book Your Ticket',
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 24),

            Container(
              padding: EdgeInsets.all(10),
              width: 308,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.indigo),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          'Select departure city',
                          style: TextStyle(color: Colors.indigo),
                        ),
                        value: selectedFrom,
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.indigo,
                        style: TextStyle(color: Colors.indigo, fontSize: 15),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedFrom = newValue;
                            calculatePrice();
                          });
                        },
                        items: cities.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.indigo),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          'Select destination city',
                          style: TextStyle(color: Colors.indigo),
                        ),
                        value: selectedTo,
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.indigo,
                        style: TextStyle(color: Colors.indigo, fontSize: 15),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTo = newValue;
                            calculatePrice();
                          });
                        },
                        items: cities.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                      ),
                    ),
                  ),

                  SizedBox(height: 12),

                  SizedBox(height: 5),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.indigo),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          'Select day',
                          style: TextStyle(color: Colors.indigo),
                        ),
                        value: selectedDay,
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.indigo,
                        style: TextStyle(color: Colors.indigo, fontSize: 15),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedDay = newValue;
                          });
                        },
                        items: days.map((String day) {
                          return DropdownMenuItem<String>(
                            value: day,
                            child: Text(day),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.indigo),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          'Select time',
                          style: TextStyle(color: Colors.indigo),
                        ),
                        value: selectedTime,
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.indigo,
                        style: TextStyle(color: Colors.indigo, fontSize: 15),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTime = newValue;
                          });
                        },
                        items: times.map((String time) {
                          return DropdownMenuItem<String>(
                            value: time,
                            child: Text(time),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.indigo),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          getPassengerText(),
                          style: TextStyle(color: Colors.indigo, fontSize: 15),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.remove, color: Colors.indigo),
                                onPressed: () {
                                  setState(() {
                                    if (passengerCount > 0) passengerCount--;
                                    calculatePrice();
                                  });
                                },
                              ),
                            ),
                            Text(
                              '$passengerCount',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            SizedBox(
                              width: 30,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                icon: Icon(Icons.add, color: Colors.indigo),
                                onPressed: () {
                                  setState(() {
                                    if (passengerCount < 20) passengerCount++;
                                    calculatePrice();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 12),
                  Container(
                    height: 50,
                    width: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      onPressed: () {
                        String? error = validateSelections();
                        if (error != null) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(error),
                              backgroundColor: Colors.red,
                            ),
                          );
                          return;
                        }
                        TripData.selectedFrom = selectedFrom ?? '';
                        TripData.selectedTo = selectedTo ?? '';
                        TripData.passengerCount = passengerCount;
                        TripData.price = price;
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => PaymentPage(),
                          ),
                        );
                      },
                      child: Text(
                        'NEXT ->',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}