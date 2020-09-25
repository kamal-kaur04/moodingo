import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodingo/bloc/moodBloc.dart';
import 'package:moodingo/events/moodEvent.dart';
import 'package:moodingo/models/moodcard.dart';

import 'package:moodingo/screens/loginpage.dart';
import 'package:moodingo/services/sign_in.dart';

class MoodHome extends StatelessWidget {
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
            padding: EdgeInsets.all(5),
            child: BlocConsumer<MoodBloc, List<MoodCard>>(
              buildWhen: (List<MoodCard> previous, List<MoodCard> current) {
                // if (current.length < current.length) {
                //   return true;
                // }
                return true;
              },
              listenWhen: (List<MoodCard> previous, List<MoodCard> current) {
                if (current.length > previous.length) {
                  return true;
                }
                return false;
              },
              builder: (context, moodList) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  itemCount: moodList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        isThreeLine: true,
                        leading: Image.asset(moodList[index].mood),
                        title: Row(
                          //mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Text(moodList[index].image),
                            SizedBox(width: 118),
                            IconButton(
                              alignment: Alignment.topRight,
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                print('button onpress');
                                BlocProvider.of<MoodBloc>(context)
                                    .add(MoodEvent.delete(index));
                                print('Bloc call');
                              },
                            ),
                          ],
                        ),
                        //onTap: () => null,
                        subtitle: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(moodList[index].datetime + ', '),
                                Text(moodList[index].time),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Stack(
                              children: <Widget>[
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Column(
                                    children: [
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: moodList[index]
                                              .activityimage
                                              .map((item) => new Image.asset(
                                                    item,
                                                    height: 30,
                                                    width: 60,
                                                  ))
                                              .toList()),
                                      Padding(padding: EdgeInsets.all(3)),
                                      Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: moodList[index]
                                              .activityname
                                              .map((item) => new Text(
                                                    '    ' + item + '     ',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ))
                                              .toList()),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.all(10)),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              listener: (BuildContext context, moodList) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Added!')),
                );
              },
            )));
  }
}
