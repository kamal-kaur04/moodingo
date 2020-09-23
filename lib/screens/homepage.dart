import 'package:flutter/material.dart';
import 'package:moodingo/screens/chart.dart';
import 'package:moodingo/screens/daymood.dart';
import 'package:moodingo/screens/loginpage.dart';
import 'package:moodingo/services/sign_in.dart';
// import 'package:dost/dialog_flow.dart';
// import 'package:dost/widget/messaging_widget.dart';
// import 'package:dost/mini_games.dart';

class HomePage extends StatefulWidget {
  @override
  MyHomePage createState() => new MyHomePage();
}

class MyHomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Moodingo',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: new IconThemeData(color: Colors.black),
          //automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(left: 15, right: 15),
            children: <Widget>[
              DrawerHeader(
                padding:
                    EdgeInsets.only(left: 85, right: 85, top: 30, bottom: 30),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                  //radius: 50,
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'NAME',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.purple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
        body: Container(
          height: 700,
          child: Stack(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
                //{
                //   print('tapped');
                // },
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(
                    'assets/5560.jpg',
                    fit: BoxFit.fill,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(20),
                ),
              ),
              Container(
                color: Colors.green.withOpacity(0.2),
                padding: const EdgeInsets.all(5),
                margin: EdgeInsets.only(top: 27, left: 20, right: 20),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('Mood Analyser', style: new TextStyle(fontSize: 18)),
                    ]),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/splash.jpg',
                  fit: BoxFit.fill,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.only(top: 253, left: 20, right: 20),
              ),
              Container(
                  color: Colors.redAccent.withOpacity(0.2),
                  padding: const EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 260, left: 20, right: 20),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text('Goal Tracker',
                            style: new TextStyle(fontSize: 18)),
                      ])),
            ],
          ),
          //)
        ));
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MoodPage(),
      //backgroundColor: Colors.purple[100],
    );
  }
}
// class ThirdRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Mini(),
//       backgroundColor: Colors.purple[100],
//     );
//   }
// }
