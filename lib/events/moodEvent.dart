import 'package:moodingo/models/moodcard.dart';

enum EventType { add, delete, initial }

class MoodEvent {
  MoodCard moodCard;
  int moodIndex;
  EventType eventType;

  MoodEvent.add(MoodCard moodCard) {
    this.eventType = EventType.add;
    this.moodCard = moodCard;
  }

  MoodEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.moodIndex = index;
  }

  MoodEvent.initial() {
    this.eventType = EventType.initial;
    this.moodCard = moodCard;
  }
}
