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
  late Animation<double> _metroOpacity;
  late Animation<double> _textOpacity;
  late Animation<double> _textSlide;

  bool showText = false;
  bool showMetro = true;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _controller.forward();

    //Show app name
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => showText = true);
    });

    // Navigate next screen
    Future.delayed(const Duration(seconds: 4), () {
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
          _moveAnimation = Tween<double>(begin: -220, end: screenWidth / 2 - 80)
              .animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: const Interval(0.0, 0.35, curve: Curves.easeInOut),
                ),
              );

          // 🔄 Scale down (transform)
          _scaleAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.4, 0.6, curve: Curves.easeOut),
            ),
          );

          // 🚇 Metro fade out
          _metroOpacity = Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.6, 0.8, curve: Curves.easeOut),
            ),
          );

          // 🟢 Text fade in
          _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
            ),
          );

          // 🟢 Text slight slide up
          _textSlide = Tween<double>(begin: 20, end: 0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
            ),
          );

          // _fadeAppName = Tween<double>(
          //   begin: 0.0,
          //   end: 1.0,
          // ).animate(CurvedAnimation(
          //   parent: _controller,
          //   curve: const Interval(.6, 1.0,curve: Curves.easeIn),
          // ),
          // );

          return Stack(
            alignment: Alignment.center,
            children: [
              // 🚇 Metro animation
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    top: screenHeight / 2 - 100, // ✅ vertical center
                    left: _moveAnimation.value,
                    child: Opacity(
                      opacity: _metroOpacity.value,
                      child: Transform.scale(
                        scale: _scaleAnimation.value,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/splash.png',
                            width: 160,
                            height: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              // 🟢 App name
              //      FadeTransition(
              //        opacity: _fadeAppName,
              //            child: Image.asset(
              //              'assets/icon.png',
              //              width: 400,
              //              height: 400,
              //              fit: BoxFit.cover,
              //            ),
              //      ),

              // );
              // Positioned(
              //   top: screenHeight / 2 - 120,
              //   child: AnimatedOpacity(
              //     opacity: showText ? 1 : 0,
              //     duration: const Duration(milliseconds: 800),
              //     child: const Text(
              //       'MetroGo',
              //       style: TextStyle(
              //         fontSize: 32,
              //         fontWeight: FontWeight.bold,
              //         letterSpacing: 1.5,
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),

              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Positioned(
                    top: screenHeight / 2 - 10 + _textSlide.value,
                    child: Opacity(
                      opacity: _textOpacity.value,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          const Text(
                            'MetroG',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            'assets/app_icon.png',
                            width: 32,
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
