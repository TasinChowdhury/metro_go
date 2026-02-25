import 'package:flutter/material.dart';

import 'package:metrogo/profile_page.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(




        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title:Text(
            "Edit Profile",

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
                MaterialPageRoute(builder: (context) => ProfilePage ()),

              );
            },
            icon: Icon(Icons.arrow_back_ios,
              size: 20,
              color: Colors.white,),


          ),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 30),

            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.grey.shade300,
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 40),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  const Text("Full Name",
                      style: TextStyle(color: Colors.black,

                        fontWeight: FontWeight.bold,
                        fontSize: 18,

                      )),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Kaniz Fatima",
                      enabledBorder: UnderlineInputBorder(  borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 1.5,
                      ),),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),


                  const Text("Email",
                      style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,)),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "kanizfatima2@gmail.com",
                      enabledBorder: UnderlineInputBorder(  borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 1.5,
                      ),),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),


                  const Text("Password",
                      style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,)),
                  TextField(
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      hintText: "********",
                      enabledBorder: UnderlineInputBorder(  borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 2,
                      ),),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),


                  const Text("Location",
                      style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,)),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Bangladesh",
                      enabledBorder: UnderlineInputBorder(  borderSide: BorderSide(
                        color: Colors.indigo,
                        width: 1.5,
                      ),),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [


                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
                          minimumSize: const Size(140, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "CANCEL",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:  Colors.indigo,
                          minimumSize: const Size(140, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text(
                          "SAVE",
                          style: TextStyle(
                            letterSpacing: 1,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}