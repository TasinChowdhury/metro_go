import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _textOpacity;
  late Animation<double> _textSlide;

  bool showText = true;
  Future<void> _navigate() async {
    await Future.delayed(const Duration(seconds: 12));

    final user = FirebaseAuth.instance.currentUser;

    if (!mounted) return;

    if (user != null) {
      Navigator.of(context).pushReplacementNamed('home_page');
    } else {
      Navigator.of(context).pushReplacementNamed('signin_screen');
    }
  }

  @override
  void initState() {
    super.initState();
    _navigate();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() => showText = true);
    });

    Future.delayed(const Duration(seconds: 3), () {
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
          final screenHeight = constraints.maxHeight;

          _textOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.48, 1.0, curve: Curves.easeIn),
            ),
          );

          _textSlide = Tween<double>(begin: 20, end: 0).animate(
            CurvedAnimation(
              parent: _controller,
              curve: const Interval(0.48, 1.0, curve: Curves.easeOut),
            ),
          );

          return Stack(
            alignment: Alignment.center,
            children: [
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
                          Image.asset('assets/app_icon.png', width: 32),
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
