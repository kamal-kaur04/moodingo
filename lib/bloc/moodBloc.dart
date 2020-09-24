import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:generic_bloc_provider/generic_bloc_provider.dart';

import 'package:moodingo/events/moodEvent.dart';
import 'package:moodingo/models/moodcard.dart';

class MoodBloc extends Bloc<MoodEvent, List<MoodCard>> {
  @override
  List<MoodCard> get initialState => List<MoodCard>();

  @override
  Stream<List<MoodCard>> mapEventToState(MoodEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<MoodCard> newState = List.from(state);
        if (event.moodCard != null) {
          newState.add(event.moodCard);
        }
        yield newState;
        break;

      case EventType.delete:
        List<MoodCard> newState = List.from(state);
        newState.removeAt(event.moodIndex);
        yield newState;
        break;

      default:
        throw Exception('Event not found $event');
    }
  }

  // MoodCard _moodCard;
  // MoodCard get getMoodCard => _moodCard;

  // StreamController<MoodEvent> _eventController =
  //     StreamController<MoodEvent>.broadcast();
  // StreamSink<MoodEvent> get eventSink => _eventController.sink;
  // Stream<MoodEvent> get eventStream => _eventController.stream;

  // StreamController<MoodCard> _moodCardController =
  //     StreamController<MoodCard>.broadcast();
  // StreamSink<MoodCard> get moodCardSink => _moodCardController.sink;
  // Stream<MoodCard> get moodCardStream => _moodCardController.stream;

  // MoodBloc() {
  //   eventStream.listen(mapEventToState);
  // }

  // void mapEventToState(MoodEvent event) {
  //   if (event == GetMoodData) {}
  // }

  // @override
  // void dispose() {
  //   _eventController.close();
  //   _moodCardController.close();
  // }
}
