import 'dart:async';

import 'package:flutter/material.dart';

import '../../main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
          child: Icon(
        Icons.settings,
        size: 60,
      )),
    );
  }
}
