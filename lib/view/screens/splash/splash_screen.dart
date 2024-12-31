import 'dart:async';
import 'package:chikista/view/screens/auth/login_screen.dart';
import 'package:chikista/view/screens/bottom_navigation/bottom_navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  var user = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (user != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNavScreen(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SignInScreen(),
            ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.png',
              height: 150,
              width: 140,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
