import 'package:flutter/material.dart';

class Mainpage extends StatefulWidget {
  Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  var selecteditem;
  int _count = 0;
  void count() {
    setState(() {
      _count++;
    });
  }

  void reset() {
    setState(() {
      _count = 0;
    });
  }

  double screenheight = 0;
  double screenwidth = 0;

  @override
  Widget build(BuildContext context) {
    screenheight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("سبحة الاستغفار",
            style: TextStyle(
                fontSize: 25,
                color: Colors.white,
                fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal[300],
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            // height: 560,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/sebha7.png"), fit: BoxFit.fill),
            ),
            child: Center(
                child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.only(
                      top: screenheight - 450,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '$_count',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: DropdownButton(
                    hint: Text(
                      "اختار من هنا",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    dropdownColor: Colors.teal[200],
                    items: [
                      "سبحان الله",
                      "الحمد لله",
                      "لا اله الا الله",
                      "الله اكبر",
                      "استغفر الله العظيم",
                      "اللهم صلي علي سيدنا محمد ",
                      "اللهم اغفر لنا ياغفور",
                      "اللهم ارحمنا يارحيم ",
                      "اللهم توفنا مسلمين",
                      "اللهم احسن خاتمتنا"
                    ]
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(
                              "$e",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        selecteditem = val;
                      });
                    },
                    value: selecteditem,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70),
                        child: Container(
                          child: InkWell(
                            onTap: reset,
                            child: Image.asset(
                              "assets/reset.png",
                              width: 70,
                              height: 80,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          padding: EdgeInsets.only(left: 40),
                          child: InkWell(
                            onTap: count,
                            child: Image.asset(
                              "assets/click.png",
                              width: 90,
                              height: 90,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ),
        ),
      ]),
    );
  }
}
