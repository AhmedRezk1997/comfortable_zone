import 'dart:convert';
//import 'dart:js';

import 'package:comfortable_zone/const/azkar.dart';
import 'package:comfortable_zone/screens/azkar/azkardetail.dart';
import 'package:flutter/material.dart';

class Azkarhome extends StatefulWidget {
  const Azkarhome({Key? key}) : super(key: key);

  @override
  State<Azkarhome> createState() => _AzkarhomeState();
}

class _AzkarhomeState extends State<Azkarhome> {
  List<Azkarmodel> azkarmodel = [];

  @override
  void initState() {
    loadazkarmodel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        centerTitle: true,
        title: Text(
          "اذكار المسلم",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildSectionItem(model: azkarmodel[index]),
          itemCount: azkarmodel.length,
        ),
      ),
    );
  }

  Widget buildSectionItem({required Azkarmodel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Azkardetail(
                  id: model.id!,
                  title: model.name!,
                )));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.teal.shade300,
                  Colors.teal.shade300,
                  Colors.teal.shade600,
                  Colors.teal.shade300
                ])),
        child: Center(
            child: Text(
          "${model.name}",
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        )),
      ),
    );
  }

  loadazkarmodel() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/data/data.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        Azkarmodel _model = Azkarmodel.fromJson(section);
        azkarmodel.add(_model);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
