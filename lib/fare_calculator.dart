import 'package:flutter/material.dart';
import 'package:metrogo/home_page.dart';
class Fare_calculator extends StatefulWidget {
  const Fare_calculator ({super.key});
  @override
  State<Fare_calculator> createState() => _Fare_calculatorState();

}

class _Fare_calculatorState extends State<Fare_calculator> {

  String? from;
  String? to;

  List<String>place=[
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title:Text(

          "Fare Calculator",

          style:TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,





//
        leading: IconButton(
          onPressed: () {

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),

            );
          },
          icon: Icon(Icons.arrow_back_ios,
            size: 20,
            color: Colors.white,),


        ),
      ),

      body: Padding(
        padding:EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            SizedBox(height: 20),

            Text(
              "From",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,


              ),
            ),
            DropdownButtonFormField<String>(
              initialValue:from ,


              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.indigo,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(


                    color:  Colors.indigo,
                    width:2,

                  ),
                ),

              ),
              hint: Text("Select station",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,

                ),
              ),
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down,
                size: 20,
                color: Colors.white,),
              style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),


              dropdownColor: Colors.white,
              items:place.map((String loc){
                return DropdownMenuItem<String>(
                  value:loc,
                  child:Text(loc),
                );
              }).toList(),
              onChanged:(loc){
                setState((){
                  from=loc;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              "TO",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,

              ),
            ),
            DropdownButtonFormField<String>(
              initialValue:to,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.indigo,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(

                    color:  Colors.indigo,
                    width:2,

                  ),
                ),

              ),
              hint: Text("Select station",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,

              ),),
              isExpanded: true,
              icon: Icon(Icons.arrow_drop_down,
                size: 20,
                color: Colors.white,),
              style:TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),

              dropdownColor: Colors.white,
              items:place.map((String loc){
                return DropdownMenuItem<String>(
                  value:loc,
                  child:Text(loc),
                );
              }).toList(),
              onChanged:(loc){
                setState((){
                  to=loc;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Colors.indigo,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Text(
                "Fare",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ],

        ),
      ),
    );



  }
}
