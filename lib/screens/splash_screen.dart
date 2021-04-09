import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/HomeScreen.dart';
import 'package:flutter_animation/utils/responsive.dart';
import 'package:flutter_animation/utils/style.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // style: const TextStyle(
        //   fontSize: 20.0,
        // ),
        child: AnimatedTextKit(
          onFinished: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen())),
          animatedTexts: [
            WavyAnimatedText('Welcome',
                speed: Duration(milliseconds: 200),
                textStyle: getBoldStyle().copyWith(fontSize: getFontSize(30))),
            WavyAnimatedText('To',
                speed: Duration(milliseconds: 200),
                textStyle: getBoldStyle().copyWith(fontSize: getFontSize(30))),
            WavyAnimatedText('Flutter Animation',
             speed: Duration(milliseconds: 200),
                textStyle: getBoldStyle().copyWith(fontSize: getFontSize(30))),
          ],
          // isRepeatingAnimation: true,
          totalRepeatCount: 1,
          onTap: () {
            print("Tap Event");
          },
        ),
      ),
    );
  }
}
