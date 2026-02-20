import 'package:flutter/material.dart';


class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:Text(
          "Map",

          style:TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        scrolledUnderElevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,),


        ),
      ),
      body :Column(
          children: [
            SizedBox(height: 20,),
            Container(

              alignment: Alignment.center,

              width: 900,

              height: 600,
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/tmap.jpeg',),
                  fit: BoxFit.cover,
                ),
              ),
            )
          ]
      ),
    );
  }
}
