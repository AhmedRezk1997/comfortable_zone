import 'dart:convert';

import 'package:comfortable_zone/const/doaadetail.dart';
import 'package:flutter/material.dart';

class Doaadetail extends StatefulWidget {
  final int id;
  final String name;
  const Doaadetail({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  State<Doaadetail> createState() => _DoaadetailState();
}

class _DoaadetailState extends State<Doaadetail> {
  List<Doaadetailmodel> doaadetaillist = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddoaadetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      appBar: AppBar(
        backgroundColor: Colors.teal[500],
        centerTitle: true,
        title: Text(
          "${widget.name}",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(color: Colors.white70, boxShadow: [
                  BoxShadow(
                    color: Colors.teal,
                    spreadRadius: 7,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
                child: ListTile(
                  title: Text(
                    "${doaadetaillist[index].body}",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontFamily: 'Othmani'),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Colors.grey.withOpacity(.8),
                ),
            itemCount: doaadetaillist.length),
      ),
    );
  }

  loaddoaadetail() async {
    doaadetaillist = [];
    DefaultAssetBundle.of(context)
        .loadString("assets/data/doaadetail.json")
        .then((data) {
      var response = json.decode(data);

      response.forEach((element) {
        Doaadetailmodel doaadetail = Doaadetailmodel.fromjson(element);
        if (doaadetail.id == widget.id) {
          doaadetaillist.add(doaadetail);
        }
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
}
