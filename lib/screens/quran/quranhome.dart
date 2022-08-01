import 'dart:convert';
import 'dart:ui';

import 'package:comfortable_zone/const/quranmodel.dart';
import 'package:comfortable_zone/screens/quran/surahhome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Quranhome extends StatefulWidget {
  Quranhome({Key? key}) : super(key: key);

  @override
  State<Quranhome> createState() => _QuranhomeState();
}

class _QuranhomeState extends State<Quranhome> {
  List<Surah> surahList = [];
  int selectedIndex = 0;
  bool isReverse = false;
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    readJson();
    super.initState();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/surah.json');
    final data = await json.decode(response);
    for (var item in data["chapters"]) {
      surahList.add(Surah.fromMap(item));
    }
    debugPrint(surahList.length.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        centerTitle: true,
        title: Text(
          "المصحف الشريف",
          style: TextStyle(
              fontFamily: 'Othmani',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      body: surahList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : chaptersList(isReverse ? surahList.reversed.toList() : surahList),
    );
  }

  Widget chaptersList(List<Surah> chapters) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10),
      controller: _controller,
      itemBuilder: (context, index) => ListTile(
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.teal[300],
          child: Text(
            chapters[index].id.toString(),
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          chapters[index].name,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Othmani',
          ),
        ),
        subtitle: Text(chapters[index].versesCount.toString()),
        trailing: Text(
          chapters[index].arabicName,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Othmani',
          ),
        ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                SurahPage(surah: chapters[index]),
          ),
        ),
      ),
      separatorBuilder: (context, index) => Divider(height: 1),
      itemCount: chapters.length,
    );
  }
}
