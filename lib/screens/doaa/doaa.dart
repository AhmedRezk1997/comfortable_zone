import 'dart:convert';

import 'package:comfortable_zone/const/doaamodel.dart';
import 'package:comfortable_zone/screens/doaa/doaadetail.dart';
import 'package:flutter/material.dart';

class Doaahome extends StatefulWidget {
  Doaahome({Key? key}) : super(key: key);

  @override
  State<Doaahome> createState() => _DoaahomeState();
}

class _DoaahomeState extends State<Doaahome> {
  List<Doaamodel> doaalist = [];
  @override
  void initState() {
    super.initState();
    loaddoaa();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[200],
        appBar: AppBar(
          backgroundColor: Colors.teal[500],
          centerTitle: true,
          title: Text(
            " دعاء",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: doaalist.length,
              itemBuilder: (context, index) =>
                  builddoaaItem(model: doaalist[index])),
        ));
  }

  Widget builddoaaItem({required Doaamodel model}) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Doaadetail(
                  id: model.id!,
                  name: model.name!,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
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
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }

  loaddoaa() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/data/doaa.json")
        .then((data) {
      var response = json.decode(data);

      response.forEach((element) {
        Doaamodel doaa = Doaamodel.fromjson(element);

        doaalist.add(doaa);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
