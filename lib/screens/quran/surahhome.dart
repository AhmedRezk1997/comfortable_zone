import 'dart:ui';

import 'package:comfortable_zone/const/quranmodel.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class SurahPage extends StatelessWidget {
  final Surah surah;
  SurahPage({required this.surah});
  @override
  Widget build(BuildContext context) {
    int count = surah.versesCount;
    int index = surah.id;

    return Scaffold(
      backgroundColor: Colors.white,
      //  backgroundColor: Colors.teal[200],
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        centerTitle: true,
        title: Text(
          surah.arabicName,
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Othmani',
          ),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.all(10),
        child: ListView(
            scrollDirection: Axis.vertical,
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: header(),
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: count <= 20 ? TextAlign.center : TextAlign.justify,
                  text: TextSpan(
                    children: [
                      for (var i = 1; i <= count; i++) ...{
                        TextSpan(
                          text: ' ' +
                              quran.getVerse(index, i, verseEndSymbol: false) +
                              ' ',
                          style: TextStyle(
                            fontFamily: 'Othmani',
                            fontSize: 25,
                            color: Colors.black87,
                          ),
                        ),
                        WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: CircleAvatar(
                              backgroundColor: Colors.teal[400],
                              child: Text(
                                '$i',
                                textAlign: TextAlign.center,
                                textScaleFactor:
                                    i.toString().length <= 2 ? 1 : .8,
                              ),
                              radius: 14,
                            ))
                      }
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  Widget header() {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        surah.id == 1 || surah.id == 9
            ? Text("")
            : Text(
                ' ' + quran.basmala + ' ',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: Colors.teal[500],
                  fontFamily: 'Othmani',
                  fontSize: 28,
                ),
              ),
      ],
    ));
  }
}
