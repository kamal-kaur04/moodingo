import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

      case EventType.initial:
        List<MoodCard> newState = List<MoodCard>();
        yield newState;
        break;

      default:
        throw Exception('Event not found $event');
    }
  }

  void _onPressed() async {
    var firebaseUser = await FirebaseAuth.instance.currentUser();
    Firestore.instance
        .collection("users")
        .document(firebaseUser.uid)
        .setData({"image": ""}).then((_) {
      print("success!");
    });
  }
}
