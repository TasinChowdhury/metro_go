import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:metrogo/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter your name";
    }
    return null;
  }

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');

    if (email == null || email.isEmpty) {
      return "Enter your email";
    } else if (!emailRegex.hasMatch(email)) {
      return "Enter valid email";
    }
    return null;
  }



  String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter location";
    }
    return null;
  }
  bool obscurePassword = true;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future loadUserData() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot doc =
    await FirebaseFirestore.instance.collection('users').doc(uid).get();

    nameController.text = doc['username'] ?? '';
    emailController.text = doc['email'] ?? '';
    locationController.text = doc['location'] ?? '';

  }

  Future updateUserProfile() async {
    final user = FirebaseAuth.instance.currentUser!;
    final uid = user.uid;


    await user.updateEmail(emailController.text.trim());
    await user.updateDisplayName(nameController.text.trim());


    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'username': nameController.text.trim(),
      'email': emailController.text.trim(),
      'location': locationController.text.trim(),
    });
  }


  @override
  void dispose(){
    emailController.dispose();
    locationController.dispose();
    nameController.dispose();
    super.dispose();

  }
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
              child: Form(
                key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  const Text("Full Name",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  TextFormField(
                    controller: nameController,
                    validator: validateName,
                    decoration: const InputDecoration(
                      hintText: "Kaniz Fatima",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 1.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),


                  Text("Email",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  TextFormField(
                    controller: emailController,
                    validator: validateEmail,
                    decoration: const InputDecoration(
                      hintText: "kanizfatima2@gmail.com",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 1.5),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo),
                      ),
                    ),
                  ),



                  const SizedBox(height: 25),



                  Text("Location",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  TextFormField(
                    controller: locationController,
                    validator: validateLocation,
                    decoration: const InputDecoration(
                      hintText: "Bangladesh",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 1.5),
                      ),
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
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                        onPressed: () async {

                          if (_formKey.currentState!.validate()) {

                            final navigator = Navigator.of(context);
                            final messenger = ScaffoldMessenger.of(context);

                            try {


                              await updateUserProfile();

                              if (!mounted) return;

                              navigator.pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => ProfilePage(),
                                ),
                              );

                            } on FirebaseAuthException catch (e) {

                              String message = "Edit failed";

                              if (e.code == 'email-already-in-use') {
                                message = "Email already in use";
                              } else if (e.code == 'weak-password') {
                                message = "Password is too weak";
                              }

                              messenger.showSnackBar(
                                SnackBar(
                                  content: Text(message),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo,
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
                      )
                    ],
                  )
                ],
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}