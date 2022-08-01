import 'dart:convert';

import 'package:comfortable_zone/const/kwatermodel.dart';
import 'package:flutter/material.dart';

class Khawaterhome extends StatefulWidget {
  Khawaterhome({Key? key}) : super(key: key);

  @override
  State<Khawaterhome> createState() => _KhawaterhomeState();
}

class _KhawaterhomeState extends State<Khawaterhome> {
  List<Khawatermodel> khawaterlist = [];
  @override
  void initState() {
    super.initState();
    loadkhawater();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: AppBar(
          backgroundColor: Colors.teal[500],
          centerTitle: true,
          title: Text(
            " خواطر",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: khawaterlist.length,
              itemBuilder: (context, index) =>
                  builddoaaItem(text: khawaterlist[index].body!)),
        ));
  }

  Widget builddoaaItem({required String text}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 15),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Colors.white70),
      child: Center(
          child: Text(
        " $text",
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Othmani'),
      )),
    );
  }

  loadkhawater() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/data/khawater.json")
        .then((data) {
      var response = json.decode(data);

      response.forEach((element) {
        Khawatermodel khawater = Khawatermodel.fromjson(element);

        khawaterlist.add(khawater);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
