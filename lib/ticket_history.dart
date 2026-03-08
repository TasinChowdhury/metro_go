import 'package:flutter/material.dart';
import 'home_page.dart'
;
class TicketHistory extends StatefulWidget {
  const TicketHistory({super.key});

  @override
  State<TicketHistory> createState() => _TicketHistoryState();
}

class _TicketHistoryState extends State<TicketHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:Text(
          "Ticket History",

          style:TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,

        leading: IconButton(
          onPressed: () {

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,
            );
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,),


        ),
      ),

      body: //SingleChildScrollView(
        Card(
          color: Color(0xffd7deff),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          child: ListTile(
            leading: const Icon(Icons.train, color: Colors.indigo),
            title: const Text("Uttara North → Motijheel"),
            subtitle: const Text("Yesterday • 10:30 am"),
            trailing: const Text("৳360"),
          ),
        ),
      //),


    );
  }
}
