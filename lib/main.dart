import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/Description.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Animation",
      home: Description(),
    );
  }
}