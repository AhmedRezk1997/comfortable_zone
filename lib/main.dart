import 'package:comfortable_zone/screens/azkar/azkarhome.dart';
import 'package:comfortable_zone/screens/doaa/doaa.dart';
import 'package:comfortable_zone/screens/doaa/doaadetail.dart';
import 'package:comfortable_zone/screens/homepage.dart';
import 'package:comfortable_zone/screens/khawater/khawater.dart';
import 'package:comfortable_zone/screens/qibla/qiblahome.dart';
import 'package:comfortable_zone/screens/quran/quranhome.dart';
import 'package:comfortable_zone/screens/sebha/sebhapage.dart';
import 'package:comfortable_zone/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "home": (context) => Homepage(),
        "quranhome": (context) => Quranhome(),
        "sebhapage": (context) => Mainpage(),
        "azkarhome": (context) => const Azkarhome(),
        "doaahome": (context) => Doaahome(),
        "khawarerhome": (context) => Khawaterhome(),
        "qibla": (context) => Qiblapage(),
      },
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
