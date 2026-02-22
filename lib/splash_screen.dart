import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _moveAnimation;
  late Animation<double> _scaleAnimation;

 // bool showText = false;
  bool showMetro = true;
  bool showLogo = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _controller.forward();

    // Show app name
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showMetro = false;
        showLogo = true;
      });
    });

    // Navigate next screen
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, 'signin_screen');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo,
      body: LayoutBuilder(
        builder: (context, constraints) {

          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;

          // 🚇 Move from left to center
          _moveAnimation = Tween<double>(
            begin: -300,
            end: screenWidth / 2 - 75,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              //curve: Curves.easeOut,
              curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
            ),
          );

          //🔄 Scale down (transform)
          _scaleAnimation = Tween<double>(
            begin: 1.0,
            end: 0.4,
          ).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.5, 0.75, curve: Curves.easeIn),
            ),
          );

          return Stack(
            alignment: Alignment.center,
            children: [
              // 🚇 Metro animation
             AnimatedOpacity(
               opacity: showMetro ? 1:0,
               duration: const Duration(seconds: 1),
               child: AnimatedBuilder(
                 animation: _controller,
                 builder: (context, child) {
                   return Positioned(
                     top: screenHeight / 2 , // ✅ vertical center
                     left: _moveAnimation.value,
                     child: Transform.scale(
                       scale: _scaleAnimation.value,
                       child: Image.asset(
                         'assets/splash.png',
                         width: 400,
                       ),
                     ),
                   );
                 },
               ),
             ),


             // 🟢 App name
          AnimatedOpacity(
            opacity: showLogo ? 1 : 0,
            duration: const Duration(seconds: 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/app_icon.png',
                  width: 100,
                  //alignment: Alignment.center,
                ),
                const SizedBox(height: 100),
                Image.asset(
                  'assets/app_name.png',
                  width: 350,
                ),
              ],
            ),
          ),
          ],
          );
        },
      ),
    );
  }
}

