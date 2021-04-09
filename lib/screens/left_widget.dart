import 'package:flutter/material.dart';
import 'package:flutter_animation/Animation/animation_file.dart';
import 'package:flutter_animation/utils/responsive.dart';
import 'package:flutter_animation/utils/style.dart';

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
  @override
  void initState() {
    widget.index = widget.list.length - 1;
    super.initState();
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

    _widget_list.add(
      Padding(
        padding: EdgeInsets.only(
          top: getSize(25),
        ),
        child: ShowUp(
          child: Text(
            "MK",
            style: getBoldStyle()
                .copyWith(color: darkFont, fontSize: getFontSize(16)),
          ),
          delay: 1000,
        ),
      ),
    );
    _widget_list.add(SizedBox(
      height: getSize(100),
    ));
    for (int i = 0; i < widget.list.length; i++) {
      _widget_list.add(
        Expanded(
          child: GestureDetector(
            onTap: () {
              widget.ontabTap(i);
            },
            child: Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      color:
                          (widget.index == i) ? greenColor : Colors.transparent,
                      width: 4),
                ),
              ),
              // padding: EdgeInsets.only(left: getSize(5)),
              child: Align(
                alignment: Alignment.center,
                child: ShowUp(
                  child: VerticalText(
                      widget.list[i], widget.keys[i], widget.index == i),
                  delay: 1000,
                ),
              ),
            ),
          ),
        ),
      );
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
}
