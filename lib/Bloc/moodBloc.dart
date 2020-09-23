import 'dart:async';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:moodingo/Bloc/moodEvent.dart';
import 'package:moodingo/models/mood.dart';
import 'package:moodingo/models/moodcard.dart';

class MoodBloc extends Bloc {
  MoodCard _moodCard;
  MoodCard get getMoodCard => _moodCard;
  List<Mood> _mood;
  List<Mood> get getMood => _mood;

  StreamController<MoodEvent> _eventController =
      StreamController<MoodEvent>.broadcast();
  StreamSink<MoodEvent> get eventSink => _eventController.sink;
  Stream<MoodEvent> get eventStream => _eventController.stream;

  StreamController<MoodCard> _moodCardController =
      StreamController<MoodCard>.broadcast();
  StreamSink<MoodCard> get moodCardSink => _moodCardController.sink;
  Stream<MoodCard> get moodCardStream => _moodCardController.stream;

  StreamController<List<Mood>> _moodController =
      StreamController<List<Mood>>.broadcast();
  StreamSink<List<Mood>> get moodSink => _moodController.sink;
  Stream<List<Mood>> get moodStream => _moodController.stream;

  MoodBloc() {
    eventStream.listen(mapEventToState);
  }

  void mapEventToState(MoodEvent event) {
    if (event == GetMoodData) {}
  }

  @override
  void dispose() {
    _eventController.close();
    _moodCardController.close();
    _moodController.close();
  }
}
