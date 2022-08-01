import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class Qiblapage extends StatefulWidget {
  Qiblapage({Key? key}) : super(key: key);

  @override
  State<Qiblapage> createState() => _QiblapageState();
}

class _QiblapageState extends State<Qiblapage> {
  double? heading = 0;
  @override
  void initState() {
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[500],
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        centerTitle: true,
        title: Text(
          "القبله ",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            " قم بمحاذاه رأس السهمين افقي",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("  لا تضع الجهاز بالقرب من شئ معدني ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 30,
          ),
          Text(
            "${heading!.ceil()}°",
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.all(18),
            child: Stack(alignment: Alignment.center, children: [
              Image.asset(
                "assets/cadrant.png",
              ),
              Transform.rotate(
                angle: ((heading ?? 0) * (pi / 180) * -1),
                child: Image.asset(
                  "assets/compass.png",
                  scale: 1.1,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
