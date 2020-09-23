import 'package:flutter/material.dart';

abstract class MoodEvent {}

class GetMoodData extends MoodEvent {
  String datetime;
  GetMoodData({@required this.datetime});
}
