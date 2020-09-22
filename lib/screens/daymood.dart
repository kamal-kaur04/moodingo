import 'package:flutter/material.dart';
import 'package:moodingo/models/activity.dart';

import 'package:moodingo/models/mood.dart';
import 'package:moodingo/models/moodcard.dart';
import 'package:moodingo/widgets/activity.dart';
import 'package:moodingo/widgets/moodicon.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class MoodPage extends StatefulWidget {
  @override
  _MoodPageState createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  MoodCard moodCard;
  String mood;
  String image;
  var datepick = new DateTime.now();
  //var timepick = new DateTime.now();
  String datetime;
  int currentindex;
  int ontapcount = 0;
  List<Mood> moods = [
    Mood('assets/rsz_fab.png', 'Fab', false),
    Mood('assets/rsz_happy.png', 'Happy', false),
    Mood('assets/rsz_neutral.png', 'Neutral', false),
    Mood('assets/rsz_sad1.png', 'Sad', false),
    Mood('assets/rsz_awful.png', 'Awful', false),
  ];

  List<Activity> act = [
    Activity('assets/sports.png', 'Sports', false),
    Activity('assets/sleeping.png', 'Good Sleep', false),
    Activity('assets/shop.png', 'Shopping', false),
    Activity('assets/relax.png', 'Relaxed', false),
    Activity('assets/reading.png', 'Read', false),
    Activity('assets/movies.png', 'Movies', false),
    Activity('assets/gaming.png', 'Gaming', false),
    Activity('assets/friends.png', 'Friends', false),
    Activity('assets/family.png', 'Family', false),
    Activity('assets/excercise.png', 'Exercise', false),
    Activity('assets/eat.png', 'Eat', false),
    Activity('assets/date.png', 'Date', false),
    Activity('assets/clean.png', 'Cleaning', false)
  ];
  Color colour = Colors.white;
  void initState() {
    super.initState();
  }

  String dateonly;
  var timepick = new TimeOfDay.fromDateTime(DateTime.now());
  @override
  Widget build(BuildContext context) {
    String datepicked = DateFormat('d/M/y').format(datepick);
    String timepicked = DateFormat.jm().format(DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
        timepick.hour,
        timepick.minute));
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(children: <Widget>[
            SizedBox(height: 150),
            Text('WHAT ARE YOU FEELING?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('(Tap to Select and Tap again to deselect!)'),
            Row(children: <Widget>[
              SizedBox(width: 50),
              FlatButton.icon(
                  icon: Icon(Icons.date_range),
                  label: Text(datepicked),
                  onPressed: () => showDatePicker(
                          context: context,
                          initialDate: datepick,
                          firstDate: DateTime(2001),
                          lastDate: DateTime(2022))
                      .then((date) => {
                            setState(() {
                              datepick = date;
                              datepicked = date.day.toString() +
                                  '/' +
                                  date.month.toString() +
                                  '/' +
                                  date.year.toString();
                              dateonly = date.day.toString() +
                                  '/' +
                                  date.month.toString();
                            }),
                          })),
              FlatButton.icon(
                  icon: Icon(Icons.timer),
                  label: Text(timepicked),
                  onPressed: () =>
                      showTimePicker(context: context, initialTime: timepick)
                          .then((time) => {
                                setState(() {
                                  timepick = time;
                                  timepicked = time.format(context).toString();
                                  datetime = datepicked + '   ' + timepicked;
                                })
                              })),
              // Container(
              //   height: 40,
              //   width: 40,
              //   child: FloatingActionButton(
              //     child: Icon(Icons.done),
              //     onPressed: () => setState(() {
              //       datetime = datepicked + '   ' + timepicked;
              //     }),
              //   ),
              // )
            ]),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: moods.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: <Widget>[
                        SizedBox(width: 15),
                        GestureDetector(
                            child: MoodIcon(
                                image: moods[index].moodimage,
                                name: moods[index].name,
                                colour: moods[index].iselected
                                    ? Colors.purple
                                    : Colors.white),
                            onTap: () => {
                                  if (ontapcount == 0)
                                    {
                                      setState(() {
                                        mood = moods[index].name;
                                        image = moods[index].moodimage;
                                        moods[index].iselected = true;
                                        ontapcount = ontapcount + 1;
                                        print(mood);
                                      }),
                                    }
                                  else if (moods[index].iselected)
                                    {
                                      setState(() {
                                        moods[index].iselected = false;
                                        ontapcount = 0;
                                      })
                                    }
                                }),
                      ],
                    );
                  }),
            ),
            Text('WHAT YOU HAVE BEEN DOING?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Hold on the activity to select,You can choose multiple',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: act.length,
                  itemBuilder: (context, index) {
                    return Row(children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                          child: ActivityIcon(
                              act[index].image,
                              act[index].name,
                              act[index].selected
                                  ? Colors.purple
                                  : Colors.white),
                          onLongPress: () => {
                                if (act[index].selected)
                                  {
                                    setState(() {
                                      act[index].selected = false;
                                    }),
                                  }
                                else
                                  setState(() {
                                    act[index].selected = true;
                                    Provider.of<MoodCard>(context,
                                            listen: false)
                                        .add(act[index]);
                                  }),
                              }),
                    ]);
                  }),
            ),
            FlatButton.icon(
                onPressed: () => {
                      setState(() {
                        Provider.of<MoodCard>(context, listen: false).addPlace(
                            datetime,
                            mood,
                            image,
                            Provider.of<MoodCard>(context, listen: false)
                                .activityimage
                                .join('_'),
                            Provider.of<MoodCard>(context, listen: false)
                                .activityname
                                .join('_'),
                            dateonly);
                      }),
                      Navigator.of(context).pushNamed('/home_screen'),
                    },
                icon: Icon(Icons.send),
                label: Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.black),
                ))
          ]),
        ));
  }
}
