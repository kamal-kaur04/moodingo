import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart' as GBloc;
import 'package:moodingo/bloc/moodBloc_delegate.dart';
import 'package:moodingo/bloc/moodBloc.dart';
import 'package:moodingo/bloc/userBloc.dart';
//import 'package:moodingo/screens/chart.dart';

import 'package:moodingo/screens/splashscreen.dart';

void main() {
  BlocSupervisor.delegate = MoodBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GBloc.BlocProvider(
      bloc: UserBloc(),
      child: BlocProvider<MoodBloc>(
        create: (context) => MoodBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ),
      ),
    );
  }
}
