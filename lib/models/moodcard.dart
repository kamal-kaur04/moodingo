import 'package:flutter/material.dart';
import 'package:moodingo/helpers/db_helper.dart';
import 'package:moodingo/helpers/mooddata.dart';
import 'package:moodingo/models/activity.dart';

import 'package:flutter/material.dart';
import 'package:moodingo/helpers/db_helper.dart';
import 'package:moodingo/helpers/mooddata.dart';
import 'package:moodingo/models/activity.dart';

///TODO::::::::::::::::::
///replace text written in "" to the same name as on firestore
class MoodCard {
  String datetime;
  String mood;
  List<String> activityname;
  List<String> activityimage;
  String image;
  // String actimage;
  // String actname;
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

  MoodCard({
    this.datetime,
    this.image,
    this.time,
    this.mood,
    this.activityimage,
    this.activityname,
  });

  toJson() {
    return {
      "datetime": this.datetime,
      "mood": this.mood,
      "time": this.time,
      "image": this.image,

      ///its a List<String> so we can use it like this
      ///if its a an object or map it should be
      ///this.activityname.map((e) => e.toJson());
      ///here toJson is same method as we are creating here
      ///TODO remove this after reading
      "activityname": this.activityname,
      "activityimage": this.activityimage,
    };
  }

  MoodCard.fromJson(Map<String, dynamic> card) {
    this.datetime = card["datetime"];
    this.mood = card["mood"];
    this.time = card["time"];
    this.image = card["image"];
    this.activityname = List<String>();
    for (var i = 0; i < card["activityname"].length; i++) {
      this.activityname.add(card["activityname"][i]);
    }
    this.activityimage = List<String>();
    for (var i = 0; i < card["activityimage"].length; i++) {
      this.activityname.add(card["activityimage"][i]);
    }

    //   var list1 = card['actImage'] as List;
    //   List<String> actImageList =
    //       list1.map((e) => activityimage.fromJson(e)).toList();
    //   var list2 = card['actName'] as List;
    //   List<String> actNameList =
    //       list2.map((e) => activityname.fromJson(e)).toList();
    //   return MoodCard(
    //       datetime: card['datetime'],
    //       image: card['image'],
    //       time: card['time'],
    //       mood: card['mood'],
    //       activityimage: actImageList,
    //       activityname: actNameList);
  }
}

class Result {
  String email;
  List<MoodCard> moodcards;

  Result({
    this.email,
    this.moodcards,
  });

  Result.fromJson(Map<String, dynamic> result) {
    this.email = result["email"];
    this.moodcards = List<MoodCard>();
    for (var i = 0; i < result["moodcards"].length; i++) {
      ///adding moodcard object to "List<MoodCard>"
      this.moodcards.add(MoodCard.fromJson(result["moodcards"][i]));
    }
  }

  toJson() {
    return {
      "email": this.email,

      ///the the toJson is comming from line #37 in same page
      "moodcards": this.moodcards.map((e) => e.toJson()),
    };
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

// class MoodCard {
//   String datetime;
//   String mood;
//   List<String> activityname = [];
//   List<String> activityimage = [];
//   String image;
//   String actimage;
//   String actname;
//   String time;

//   // MoodCard(String datetime, String image, String time, String mood,
//   //     List<String> activityimage, List<String> activityname) {
//   //   this.datetime = datetime;
//   //   this.image = image;
//   //   this.time = time;
//   //   this.mood = mood;
//   //   this.activityimage = activityimage;
//   //   this.activityname = activityname;
//   //   }

//   MoodCard(
//       {this.datetime,
//       this.image,
//       this.time,
//       this.mood,
//       this.activityimage,
//       this.activityname});

//   factory MoodCard.fromJson(Map<String, dynamic> card) {
//     var list1 = card['actImage'] as List;
//     List<String> actImageList =
//         list1.map((e) => activityimage.fromJson(e)).toList();
//     var list2 = card['actName'] as List;
//     List<String> actNameList =
//         list2.map((e) => activityname.fromJson(e)).toList();
//     return MoodCard(
//         datetime: card['datetime'],
//         image: card['image'],
//         time: card['time'],
//         mood: card['mood'],
//         activityimage: actImageList,
//         activityname: actNameList);
//   }
// }

// class Result {
//   final String email;
//   final List<MoodCard> moodcards;

//   Result({this.email, this.moodcards});

//   factory Result.fromJson(Map<String, dynamic> result) {
//     var list = result['moodCard'] as List;
//     List<MoodCard> moodList = list.map((e) => MoodCard.fromJson(e)).toList();

//     return Result(
//       email: result['email'],
//       moodcards: moodList,
//     );
//   }
// }

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
