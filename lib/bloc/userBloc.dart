import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:moodingo/events/userEvent.dart';
import 'package:moodingo/services/sign_in.dart';

class UserBloc extends Bloc {
  FirebaseUser _owner;

  set setFirebaseUser(FirebaseUser user) {
    this._owner = user;
  }

  void signoutGoogle() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
  }

  StreamController<UserEvent> _eventController =
      StreamController<UserEvent>.broadcast();
  StreamSink<UserEvent> get eventSink => _eventController.sink;
  Stream<UserEvent> get eventStream => _eventController.stream;

  UserBloc() {
    eventStream.listen(mapEventToStream);
  }

  Future<void> mapEventToStream(UserEvent event) async {
    if (event is SignOut) {
      await FirebaseAuth.instance.signOut();
      await googleSignIn.signOut();
    }
  }

  @override
  void dispose() {
    _eventController.close();
  }
}
