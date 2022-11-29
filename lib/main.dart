import 'package:flutter/material.dart';
import 'package:hadith/cubit/blocobserver.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hadith/cubit/cubit/cubit.dart';
import 'package:hadith/cubit/states/states.dart';
import 'package:hadith/modules/audio.dart';
import 'package:hadith/modules/detailofread.dart';
import 'package:hadith/modules/readahadih.dart';
import 'package:hadith/modules/splash.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HadithCubit()..getAlldata(),
      child: BlocConsumer<HadithCubit, HadithStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: "ahadith",
              home: Splash()
              // const Splash(),
              );
        },
      ),
    );
  }
}
