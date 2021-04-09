import 'dart:math';

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

  //Value for animation
  double value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _children = [
      Screen1("1", (v) {
        setState(() {
          value = v;
        });
      }),
      Screen1("2", (v) {
        setState(() {
          value = v;
        });
      }),
      Screen1("3", (v) {
        setState(() {
          value = v;
        });
      }),
      Screen1("4", (v) {
        setState(() {
          value = v;
        });
      }),
      // Screen1("2"),
      // Screen1("3"),
      // Screen1("dat 4"),
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
          body: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: getSize(100), left: getSize(50)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: getSize(100),
                          height: getSize(100),
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                // color: ColorConstants.getShadowColor,
                                color: Colors.grey.withOpacity(0.7),
                                offset: Offset(2, 2),
                                blurRadius: 5.0,
                                spreadRadius: 2.0,
                              ),
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage("asset/profile.jpg"),
                            ),
                          ),
                        ),
                        SizedBox(height: getSize(30)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: (checkIndex == 0)
                                      ? greenColor
                                      : Colors.transparent,
                                  width: 4),
                            ),
                          ),
                          child: Text(
                            _list[0].toUpperCase(),
                            style: getBoldStyle().copyWith(
                                color: darkFont, fontSize: getFontSize(16)),
                          ),
                        ),
                        SizedBox(height: getSize(30)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: (checkIndex == 1)
                                      ? greenColor
                                      : Colors.transparent,
                                  width: 4),
                            ),
                          ),
                          child: Text(
                            _list[1].toUpperCase(),
                            style: getBoldStyle().copyWith(
                                color: darkFont, fontSize: getFontSize(16)),
                          ),
                        ),
                        SizedBox(height: getSize(30)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: (checkIndex == 2)
                                      ? greenColor
                                      : Colors.transparent,
                                  width: 4),
                            ),
                          ),
                          child: Text(
                            _list[2].toUpperCase(),
                            style: getBoldStyle().copyWith(
                                color: darkFont, fontSize: getFontSize(16)),
                          ),
                        ),
                        SizedBox(height: getSize(30)),
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: (checkIndex == 3)
                                      ? greenColor
                                      : Colors.transparent,
                                  width: 4),
                            ),
                          ),
                          child: Text(
                            _list[3].toUpperCase(),
                            style: getBoldStyle().copyWith(
                                color: darkFont, fontSize: getFontSize(16)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: value),
                duration: Duration(milliseconds: 500),
                builder: (_, double val, __) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: Container(
                      child: getAllListItem(),
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ],
          )),
    );
  }

  Container getAllListItem() {
    return Container(
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
    );
  }
}
