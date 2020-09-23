import 'package:flutter/material.dart';
//import 'package:moodingo/screens/chart.dart';
import 'package:moodingo/screens/loginpage.dart';
//import 'package:provider/provider.dart';
//import './screens/homepage.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    // routes: {
    //   '/home_screen': (ctx) => HomePage(),
    //   '/chart': (ctx) => MoodChart(),
    // },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
