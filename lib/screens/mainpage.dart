import 'package:flutter/material.dart';
//import 'package:moodingo/screens/chart.dart';
//import 'package:moodingo/screens/mood.dart';
// import 'package:dost/dialog_flow.dart';

class MainPage extends StatefulWidget {
  @override
  MyMainPage createState() => new MyMainPage();
}

class MyMainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Moodingo',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: MoodPage(),
        //backgroundColor: Colors.purple[100],
        );
  }
}
