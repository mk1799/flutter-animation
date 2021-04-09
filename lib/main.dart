import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/HomeScreen.dart';
import 'package:flutter_animation/screens/splash_screen.dart';
import 'package:flutter_animation/utils/responsive.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overScroll) {
        overScroll.disallowGlow();
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter Animation",
        navigatorKey: globalKey,
        home: SplashScreen(),
      ),
    );
  }
}
