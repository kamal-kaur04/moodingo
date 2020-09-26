import 'package:flutter/material.dart';
import 'package:moodingo/helpers/db_helper.dart';
import 'package:moodingo/helpers/mooddata.dart';
import 'package:moodingo/models/activity.dart';

class MoodCard {
  String datetime;
  String mood;
  List<String> activityname = [];
  List<String> activityimage = [];
  String image;
  String actimage;
  String actname;
  String time;

  // MoodCard(String datetime, String image, String time, String mood,
  //     List<String> activityimage, List<String> activityname) {
  //   this.datetime = datetime;
  //   this.image = image;
  //   this.time = time;
  //   this.mood = mood;
  //   this.activityimage = activityimage;
  //   this.activityname = activityname;
  //   }

  MoodCard(
      {this.datetime,
      this.image,
      this.time,
      this.mood,
      this.activityimage,
      this.activityname});

  factory MoodCard.fromJson(Map<String, dynamic> card) {
    var list1 = card['actImage'] as List;
    List<String> actImageList =
        list1.map((e) => activityimage.fromJson(e)).toList();
    var list2 = card['actName'] as List;
    List<String> actNameList =
        list2.map((e) => activityname.fromJson(e)).toList();
    return MoodCard(
        datetime: card['datetime'],
        image: card['image'],
        time: card['time'],
        mood: card['mood'],
        activityimage: actImageList,
        activityname: actNameList);
  }
}

class Result {
  final String email;
  final List<MoodCard> moodcards;

  Result({this.email, this.moodcards});

  factory Result.fromJson(Map<String, dynamic> result) {
    var list = result['moodCard'] as List;
    List<MoodCard> moodList = list.map((e) => MoodCard.fromJson(e)).toList();

    return Result(
      email: result['email'],
      moodcards: moodList,
    );
  }
}

//   List items;
//   List<MoodData> data = [];
//   String date;
//   bool isloading = false;
//   List<String> actiname = [];

//   void add(Activity act) {
//     activityimage.add(act.image);
//     activityname.add(act.name);
//     //notifyListeners();
//   }

//   Future<void> addPlace(String datetime, String mood, String image,
//       String actimage, String actname, String date) async {
//     DBHelper.insert('user_moods', {
//       'datetime': datetime,
//       'mood': mood,
//       'image': image,
//       'actimage': actimage,
//       'actname': actname,
//       'date': date
//     });
//     //notifyListeners();
//   }

//   Future<void> deletePlaces(String datetime) async {
//     DBHelper.delete(datetime);
//     //notifyListeners();
//   }
// }
