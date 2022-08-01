import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Splashscreen extends StatefulWidget {
  Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed("home");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: Lottie.asset("assets/splash.json"),
            ),
            DefaultTextStyle(
                style: TextStyle(fontSize: 25),
                child: AnimatedTextKit(
                  animatedTexts: [
                    WavyAnimatedText("استثمر وقتك "),
                  ],
                  isRepeatingAnimation: false,
                )),
            DefaultTextStyle(
                style: TextStyle(fontSize: 25),
                child: AnimatedTextKit(
                  animatedTexts: [WavyAnimatedText(" مع اللًه")],
                  isRepeatingAnimation: false,
                )),
          ],
        ),
      ),
    );
  }
}
