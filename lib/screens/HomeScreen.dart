import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animation/screens/screen1.dart';
import 'package:flutter_animation/screens/test.dart';
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

class LeftWidget extends StatefulWidget {
  int index;
  List<String> list;
  List<GlobalKey> keys;
  Function ontabTap;
  LeftWidget({this.keys, this.list, this.index, this.ontabTap});

  @override
  _LeftWidgetState createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> with TickerProviderStateMixin {
  Offset checkedPositionOffset = Offset(0, 0);
  Offset lastCheckOffset = Offset(0, 0);

  Offset animationOffset = Offset(0, 0);
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    widget.index = widget.list.length - 1;
    super.initState();

    SchedulerBinding.instance.endOfFrame.then((value) {
      calcuteCheckOffset();
      addAnimation();
    });
  }

  void calcuteCheckOffset() {
    lastCheckOffset = checkedPositionOffset;
    RenderBox renderBox =
        widget.keys[widget.index].currentContext.findRenderObject();
    Offset widgetOffset = renderBox.localToGlobal(Offset(10, 0));
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
            width: getSize(60),
            decoration: BoxDecoration(
              color: Colors.white10,
              // borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildList(),
            ),
          ),
          // Positioned(
          //   top: animationOffset.dy,
          //   left: animationOffset.dx,
          //   child: CustomPaint(
          //     painter: CheckPointPainter(Offset(10, 0)),
          //   ),
          // )
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> _widget_list = [];

    _widget_list.add(Padding(
        padding: EdgeInsets.only(
          top: getSize(25),
        ),
        child: Text(
          "MK",
          style: getBoldStyle()
              .copyWith(color: darkFont, fontSize: getFontSize(16)),
        )));
    _widget_list.add(SizedBox(
      height: getSize(100),
    ));
    for (int i = 0; i < widget.list.length; i++) {
      _widget_list.add(Expanded(
        child: GestureDetector(
            onTap: () {
              widget.ontabTap(i);
            },
            child: Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: (widget.index == i)
                              ? greenColor
                              : Colors.transparent,
                          width: 4))),
              // padding: EdgeInsets.only(left: getSize(5)),
              child: Align(
                alignment: Alignment.center,
                child: VerticalText(
                    widget.list[i],
                    widget.keys[i],
                    widget.index == i &&
                        (_animationController != null &&
                            _animationController.isCompleted)),
              ),
            )),
      ));
    }
    _widget_list.add(Padding(
      padding: EdgeInsets.only(
        top: getSize(100),
        bottom: getSize(20),
      ),
      child: Icon(
        Icons.blur_on_sharp,
        color: darkFont,
        size: getSize(30),
      ),
    ));
    return _widget_list;
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
