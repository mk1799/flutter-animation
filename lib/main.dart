import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_animation/screens/Description.dart';
import 'package:flutter_animation/utils/responsive.dart';
=======
import 'package:flutter_animation/screens/HomeScreen.dart';
>>>>>>> 32da38604678f39dd6e6dd56f202b994f3ec3ded

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: "Flutter Animation",
<<<<<<< HEAD
      home: Description(),
      navigatorKey: globalKey,
=======
      home: HomeScreen(),
>>>>>>> 32da38604678f39dd6e6dd56f202b994f3ec3ded
    );
  }
}
