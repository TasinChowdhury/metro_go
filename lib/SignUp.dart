
  import 'package:flutter/material.dart';

  class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return Scaffold(
//change
    extendBodyBehindAppBar: true,
  appBar: AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.transparent,

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
 // body: SingleChildScrollView(
  body: Container(
 alignment:Alignment.center,
  padding: EdgeInsets.all(32),
    //height: MediaQuery.of(context).size.height-50,

    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/bg1.jpeg'),
        fit: BoxFit.cover,
      ),
    ),

  child: Column(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
  Column(
  children: <Widget>[
  Text("Sign up",
  style: TextStyle(
  fontSize: 30,
    color:Colors.white,

  fontWeight: FontWeight.bold,

  ),),
  SizedBox(height: 30,),
  Text("Create an account",
  style: TextStyle(
  fontSize: 15,
  color:Colors.white),)


  ],
  ),
  Column(
  children: <Widget>[
  inputFile(label: "Username"),
  inputFile(label: "Email"),
  inputFile(label: "Password", obscureText: true),
  inputFile(label: "Confirm Password ", obscureText: true),
  ],
  ),
  Container(
  padding: EdgeInsets.only(top: 3, left: 3),
  decoration:
  BoxDecoration(
  borderRadius: BorderRadius.circular(50),
  border: Border(
  bottom: BorderSide(color: Colors.black),
  top: BorderSide(color: Colors.black),
  left: BorderSide(color: Colors.black),
  right: BorderSide(color: Colors.black),



  )

  ),
  child: MaterialButton(
  minWidth: double.infinity,
  height: 60,
  onPressed: () {},
  color: Color(0xff0095FF),
  elevation: 0,
  shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(50),

  ),
  child: Text(
  "Sign up", style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  color: Colors.white,

  ),
  ),

  ),



  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  Text("Already have an account?"),
  Text(" Login", style:TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 18
  ),
  )
  ],
  )



  ],

  ),




  ),

  );
  }
  }




  Widget inputFile({label, obscureText = false})
  {
  return Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: <Widget>[
  Text(
  label,
  style: TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color:Colors.white
  ),

  ),
  SizedBox(
  height: 5,
  ),
  TextField(
  obscureText: obscureText,
  decoration: InputDecoration(
    filled:true,
  fillColor: Colors.white,

  contentPadding: EdgeInsets.symmetric(vertical: 0,
  horizontal: 10),
  enabledBorder: OutlineInputBorder(
  borderSide: BorderSide(
  color: Colors.grey
  ),

  ),
  border: OutlineInputBorder(
  borderSide: BorderSide(color: Colors.grey)
  )
  ),
  ),
  SizedBox(height: 10,)
  ],
  );
  }


