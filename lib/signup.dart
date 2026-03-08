import 'package:flutter/material.dart';
import 'signin_screen.dart';
import 'package:metrogo/home_page.dart';

class  SignupPage extends StatefulWidget {
  const  SignupPage({super.key});

  @override
  State< SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State< SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');

    if (email == null || email.isEmpty) {
      return "Enter your email";
    } else if (!emailRegex.hasMatch(email)) {
      return "Enter a valid email";
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Enter your password";
    } else if (password.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }
  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Confirm your password";
    } else if (value != passwordController.text) {
      return "Password does not match";
    }
    return null;
  }
  String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return "Enter your username";
    } else if (username.length < 3) {
      return "Username must be at least 3 characters";
    }
    return null;
  }
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg1.2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,

          ),

          body: Stack(
              children: [

                Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(top: 80),
                  child: const Column(
                    children: [
                      Text(
                        'Create Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 33,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Sign up to get started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),


                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.30,
                      left: 30,
                      right: 30,
                      bottom: 40,

                    ),
                    child:
                     Form(
                    key: _formKey,
                    child:Column(
                        children: [


                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: validateUsername,
                          ),

                          const SizedBox(height: 20),


                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: validateEmail,
                          ),
                          const SizedBox(height: 20),


                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: validateConfirmPassword,

                          ),

                          const SizedBox(height: 20),


                          TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            validator: validateConfirmPassword,
                          ),

                          const SizedBox(height: 30),


                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),

                                  );
                                }

                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 40),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [





                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already have account? ",
                                    style: TextStyle(color: Colors.white,
                                      fontSize:16,
                                      fontWeight:FontWeight.bold,),
                                  ),
                                  GestureDetector(
                                    onTap: () {

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (
                                                context) => const SigninScreen(),
                                          ),
                                        );

                                    },
                                    child: const Text(
                                      "Sign In",
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize:16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),


                              const SizedBox(height: 30),
                            ],
                          ),
                        ]
                    ),
                     ),
                  ),
                ),
              ]
          ),
        )
    );
  }
}

