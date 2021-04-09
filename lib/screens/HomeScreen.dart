import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animation/screens/left_widget.dart';
import 'package:flutter_animation/screens/screen1.dart';
import 'package:flutter_animation/utils/responsive.dart';
import 'package:flutter_animation/utils/style.dart';

import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> _children;
  List<String> _list = ["CAMPAIGNS", "ARTISTS", "EVENTS", "GRANTS"];

  List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  int checkIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _children = [
      Screen1("1"),
      Screen1("2"),
      Screen1("3"),
      Screen1("dat 4"),
    ];
  }

  void indexChecked(int i) {
    if (checkIndex == i) return;

    setState(() {
      checkIndex = i;
      // calcuteCheckOffset();
      // addAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Row(
            children: <Widget>[
              LeftWidget(
                index: checkIndex,
                keys: _keys,
                list: _list,
                ontabTap: indexChecked,
              ),
              Expanded(
                // child: Container(),
                child: Container(
                  color: bgColor,
                  child: _children[checkIndex],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
