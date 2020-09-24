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

  MoodCard(String datetime, String image, String time, String mood,
      List<String> activityimage, List<String> activityname) {
    this.datetime = datetime;
    this.image = image;
    this.time = time;
    this.mood = mood;
    this.activityimage = activityimage;
    this.activityname = activityname;
  }
  //MoodCard({this.actimage, this.actname, this.datetime, this.image, this.mood});
  List items;
  List<MoodData> data = [];
  String date;
  bool isloading = false;
  List<String> actiname = [];

  void add(Activity act) {
    activityimage.add(act.image);
    activityname.add(act.name);
    //notifyListeners();
  }

  Future<void> addPlace(String datetime, String mood, String image,
      String actimage, String actname, String date) async {
    DBHelper.insert('user_moods', {
      'datetime': datetime,
      'mood': mood,
      'image': image,
      'actimage': actimage,
      'actname': actname,
      'date': date
    });
    //notifyListeners();
  }

  Future<void> deletePlaces(String datetime) async {
    DBHelper.delete(datetime);
    //notifyListeners();
  }
}
