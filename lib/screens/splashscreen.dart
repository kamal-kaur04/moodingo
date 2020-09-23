import 'package:flutter/material.dart';
import 'package:moodingo/screens/loginpage.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 4),
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
            image: new AssetImage("assets/Symbols.png"),
          )),
          child: Center(
            child: Image.asset(
              'assets/Group -13.png',
              width: 700,
              height: 800,
              alignment: Alignment.bottomCenter,
            ),
          )),
    );
  }
}
