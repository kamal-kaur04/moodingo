import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:moodingo/screens/daymood.dart';
import 'package:moodingo/screens/moodhome.dart';

class MoodDashboard extends StatefulWidget {
  @override
  MyMoodDashboard createState() => new MyMoodDashboard();
}

class MyMoodDashboard extends State<MoodDashboard> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    MoodHome(),
    MoodPage(),
  ];

  // void onTapped(int value) {
  //   setState(() {
  //     _selectedIndex = value;
  //   });
  // }

  // Widget build(BuildContext context) {
  //   getScreen(int index) {
  //     if (index == 0) {
  //       return MoodHome();
  //     } else if (index == 1) {
  //       return MoodPage();
  //     }
  //   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: getScreen(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.home,
                size: 30.0,
                color: Colors.grey[300],
              ),
              title: Text('HOME'),
              activeIcon: Icon(
                LineAwesomeIcons.home,
                color: Colors.white,
              )),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.plus_circle,
                size: 30.0,
                color: Colors.grey[300],
              ),
              title: Text('ADD NEW')),
          BottomNavigationBarItem(
              icon: Icon(
                LineAwesomeIcons.user,
                size: 30.0,
                color: Colors.grey[300],
              ),
              title: Text('STATISTICS')),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
