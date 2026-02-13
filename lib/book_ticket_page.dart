import 'package:flutter/material.dart';

import 'SignUp.dart';

class BookTicketPage extends StatefulWidget {
  const BookTicketPage({super.key});

  @override
  State<BookTicketPage> createState() => _BookTicketPageState();
}

class _BookTicketPageState extends State<BookTicketPage> {
  bool isOneWaySelected = false;
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
    'Mirpur10','Mirpur11',
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          elevation: 0,
          title: const Text("BOOKING TICKET"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignupPage()));
            },
          ),
        ),
        body: Center(
          child: Container(
              child: Column(
                  children: [
                  Container(
                  height: 200,
                  decoration: BoxDecoration(
                      color: Colors.indigo
                      ,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(300),
                        bottomRight: Radius.circular(300),
                      )
                  ),
                  child: Center(
                      child: Image.asset('assets/train.png')
                  ),
                  ),
              SizedBox(  height: 20,),
              Text('Book Your Ticket',
                  style: TextStyle(fontSize: 22,
                    color: Colors.black,fontWeight: FontWeight.bold),),
                    SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isOneWaySelected = true;
                            });
                          },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isOneWaySelected ? Colors.indigo : Colors.white,
                              foregroundColor: isOneWaySelected ? Colors.white : Colors.indigo,
                              elevation: 0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                            ),
                            child: const Text(
                                'One way',
                                style: TextStyle(fontSize: 17,
                                  ),
                            ),
                        ),
                    ),
                    Container(
                        height: 40,
                        width: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isOneWaySelected ? Colors.white : Colors.indigo,
                              foregroundColor: isOneWaySelected ? Colors.indigo : Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                            ),
                            onPressed: () {setState(() {
                              isOneWaySelected = false;
                            });
                              },
                            child: Text(
                                'Round Trip',
                                style: TextStyle(
                                  fontSize: 14,

                                ),
                            ),

                        ),
                    ),
                  ],
              ),
              SizedBox(height: 10,),
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

                  SizedBox(
                    height: 10,
                  ),

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

                  SizedBox(
                    height: 12,
                  ),

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
                              hint: Text('Select day',
                                  style: TextStyle(color: Colors.indigo)),
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
                        SizedBox(height: 10),
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
                              hint: Text('Select time',
                                  style: TextStyle(color: Colors.indigo)),
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
                        SizedBox(height: 10),
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
                                passengerCount == 0 ? 'Passengers' : '$passengerCount Passenger${passengerCount == 1 ? '' : 's'}',
                                style: TextStyle(
                                  color: passengerCount == 0 ? Colors.indigo: Colors.indigo,
                                  fontSize: 15,
                                ),
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
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    '$passengerCount',
                                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.indigo),
                                  ),
                                  SizedBox(
                                    width: 30,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(Icons.add, color: Colors.indigo),
                                      onPressed: () {
                                        setState(() {
                                          if (passengerCount < 9) passengerCount++;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),
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
                                borderRadius: BorderRadius.circular(20.0)),
                          ),
                        onPressed: () {},
                        child: Text(
                          'NEXT ->',
                          style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w900 ,
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
        ),
    );
  }
}
