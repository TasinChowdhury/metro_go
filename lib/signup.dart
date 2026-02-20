import 'package:flutter/material.dart';
import 'signin_screen.dart';

class  SignupPage extends StatefulWidget {
  const  SignupPage({super.key});

  @override
  State< SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State< SignupPage> {
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
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
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
                    child: Column(
                        children: [


                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),


                          TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),


                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),


                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Confirm Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),

                          const SizedBox(height: 30),


                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {

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


                              const SizedBox(height: 20),


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
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SigninScreen(),
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
              ]
          ),
        )
    );
  }
}

