import 'package:flutter/material.dart';
class fare_calculator extends StatefulWidget {
  @override
  State<fare_calculator> createState() => _fare_calculatorState();
}

class _fare_calculatorState extends State<fare_calculator> {

  String? From;
  String? To;

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
        scrolledUnderElevation: 0,

        surfaceTintColor:  Colors.transparent,


//
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
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
                initialValue:From ,


            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.lightBlue,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(

                  color:  Colors.lightBlue,
                  width:2,

                ),
              ),
            ),
            hint: Text("Select station"),
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down),
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
            From=loc;
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
                    initialValue:To,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.lightBlue,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(

                            color:  Colors.lightBlue,
                            width:2,

                        ),
                      ),
                    ),
                    hint: Text("Select station"),
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down),
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
                        To=loc;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {},
                    color: Colors.lightBlue,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),

                    ),
                    child: Text(
                      "Fare", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,

                    ),
                    ),

                  ),
    ],

    ),
    ),
    );



  }
}
