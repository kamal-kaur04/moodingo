import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodingo/Bloc/moodBloc_delegate.dart';
import 'package:moodingo/Bloc/moodBloc.dart';
//import 'package:moodingo/screens/chart.dart';

import 'package:moodingo/screens/splashscreen.dart';

void main() {
  BlocSupervisor.delegate = MoodBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<MoodBloc>(
        create: (context) => MoodBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
