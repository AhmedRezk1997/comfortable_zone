import 'dart:ui';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //  backgroundColor: Colors.teal[500],
        backgroundColor: Colors.teal[300],

        centerTitle: true,
        title: Text(
          "حصن المسلم",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Othmani',
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.teal,
              Colors.teal.shade300,
            ])),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "  كن مع الله   ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: 'Othmani',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(spreadRadius: 2, color: Colors.white54)
                        ],
                        color: Colors.teal[700],
                        borderRadius: BorderRadius.all(
                          Radius.circular(22),
                        )),
                    height: 80,
                    width: double.infinity,

                    //  width: MediaQuery.of(context).size.width / 2 - 28,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("quranhome");
                      },
                      child: Center(
                        child: Text(
                          "المصحف الشريف",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 155,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2, color: Colors.white54)
                                ],
                                color: Colors.teal[700],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                )),
                            height: 120,
                            width: MediaQuery.of(context).size.width / 2 - 28,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("sebhapage");
                              },
                              child: Center(
                                child: Text(
                                  "التسبيح",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2, color: Colors.white54)
                                ],
                                color: Colors.teal[700],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                )),
                            height: 120,
                            width: MediaQuery.of(context).size.width / 2 - 28,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("doaahome");
                              },
                              child: Center(
                                child: Text(
                                  "ادعيه ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 155,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2, color: Colors.white54)
                                ],
                                color: Colors.teal[700],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                )),
                            height: 120,
                            width: MediaQuery.of(context).size.width / 2 - 28,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("khawarerhome");
                              },
                              child: Center(
                                child: Text(
                                  " خواطر ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      spreadRadius: 2, color: Colors.white54)
                                ],
                                color: Colors.teal[700],
                                borderRadius: BorderRadius.all(
                                  Radius.circular(22),
                                )),
                            height: 120,
                            width: MediaQuery.of(context).size.width / 2 - 28,
                            child: FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed("qibla");
                              },
                              child: Center(
                                child: Text(
                                  " القبله ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(spreadRadius: 2, color: Colors.white54)
                        ],
                        color: Colors.teal[700],
                        borderRadius: BorderRadius.all(
                          Radius.circular(22),
                        )),
                    height: 80,
                    width: double.infinity,

                    //  width: MediaQuery.of(context).size.width / 2 - 28,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed("azkarhome");
                      },
                      child: Center(
                        child: Text(
                          " الاذكار",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
