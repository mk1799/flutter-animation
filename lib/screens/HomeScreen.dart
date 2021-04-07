import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animation/screens/test.dart';
import 'package:flutter_animation/utils/responsive.dart';
import 'package:flutter_animation/utils/style.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Row(
          children: <Widget>[
            LeftWidget(),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }}


class LeftWidget extends StatefulWidget {
  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> with TickerProviderStateMixin {
  List<String> _list = ["CAMPAIGNS", "ARTISTS", "EVENTS", "GRANTS"];

  List<GlobalKey> _keys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  int checkIndex = 0;

  Offset checkedPositionOffset = Offset(0, 0);
  Offset lastCheckOffset = Offset(0, 0);

  Offset animationOffset = Offset(0, 0);
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    checkIndex = _list.length - 1;
    super.initState();

    SchedulerBinding.instance.endOfFrame.then((value) {
      calcuteCheckOffset();
      addAnimation();
    });
  }

  void calcuteCheckOffset() {
    lastCheckOffset = checkedPositionOffset;
    RenderBox renderBox = _keys[checkIndex].currentContext.findRenderObject();
    Offset widgetOffset = renderBox.localToGlobal(Offset(0, 0));
    Size widgetSise = renderBox.size;
    checkedPositionOffset = Offset(widgetOffset.dx + widgetSise.width,
        widgetOffset.dy + widgetSise.height);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            width: getSize(70),
            decoration: BoxDecoration(
              color: Color(0xffED305A),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: _buildList(),
            ),
          ),
          Positioned(
            top: animationOffset.dy,
            left: animationOffset.dx,
            child: CustomPaint(
              painter: CheckPointPainter(Offset(10, 0)),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> _widget_list = [];

    _widget_list.add(Padding(
      padding: EdgeInsets.only(
        top: 50,
      ),
      child: Icon(
        Icons.more_horiz,
        color: Colors.white,
        size: 30,
      ),
    ));
    _widget_list.add(Padding(
      padding: EdgeInsets.only(
        top: 50,
      ),
      child: Icon(
        Icons.search,
        color: Colors.white,
        size: 30,
      ),
    ));
    for (int i = 0; i < _list.length; i++) {
      _widget_list.add(Expanded(
        child: GestureDetector(
            onTap: () {
              indexChecked(i);
            },
            child: VerticalText(
                _list[i],
                _keys[i],
                checkIndex == i &&
                    (_animationController != null &&
                        _animationController.isCompleted))),
      ));
    }
    _widget_list.add(Padding(
      padding: EdgeInsets.only(
        top: 50,
        bottom: 50,
      ),
      child: Icon(
        Icons.map,
        color: Colors.white,
        size: 30,
      ),
    ));
    return _widget_list;
  }

  void indexChecked(int i) {
    if (checkIndex == i) return;

    setState(() {
      checkIndex = i;
      calcuteCheckOffset();
      addAnimation();
    });
  }

  void addAnimation() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this)
          ..addListener(() {
            setState(() {
              animationOffset =
                  Offset(checkedPositionOffset.dx, _animation.value);
            });
          });

    _animation = Tween(begin: lastCheckOffset.dy, end: checkedPositionOffset.dy)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.easeInOutBack));
    _animationController.forward();
  }
}
