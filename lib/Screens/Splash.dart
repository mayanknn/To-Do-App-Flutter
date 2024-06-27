import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_list/Components.dart';
import 'package:to_do_list/Screens/Login.dart';

 // Make sure this import path is correct

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _controller.forward();

    // Delay navigation using Timer after a short delay
    Timer(Duration(seconds: 3), () {
      navigateToNextScreen();
    });
  }

  // This method will handle navigation after the delay
  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      SlidePageRoute(page: LoginScreen()), // Use any of the custom transitions here
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Image.asset(
              'assets/images/microsoft_to_do_macos_bigsur_icon_189960.png', // Make sure this image path is correct
            ),
          ),
        ),
      ),
    );
  }
}
