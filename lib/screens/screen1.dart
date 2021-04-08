import 'package:flutter/material.dart';
import 'package:flutter_animation/utils/responsive.dart';
import 'package:flutter_animation/utils/style.dart';

class Screen1 extends StatefulWidget {
  final String screencount;
  Screen1(this.screencount);
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  int cate = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(getSize(15)),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.5), width: 1))),
          child: Row(
            children: [
              Container(
                width: getSize(40),
                height: getSize(40),
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
                        image: AssetImage("asset/profile.jpg"))),
              ),
              Expanded(child: Container()),
              Icon(
                Icons.search,
                color: lightFont,
                size: getSize(35),
              ),
              SizedBox(
                width: getSize(10),
              ),
              Icon(
                Icons.menu_outlined,
                color: lightFont,
                size: getSize(35),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: getSize(20), left: getSize(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Discover",
                textAlign: TextAlign.left,
                style: getBoldStyle().copyWith(fontSize: getFontSize(30)),
              ),
              SizedBox(
                height: getSize(30),
              ),
              Container(
                height: getSize(40),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){
                          setState(() {
                            cate = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: getSize(10)),
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(20), vertical: getSize(10)),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getSize(20)),
                              color: (cate == index )?Colors.black:Colors.transparent),
                          child: Text(
                            "TRENDING",
                            style:
                                getRegularStyle().copyWith(color: (cate == index )?Colors.white : lightFont),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        )
      ],
    ));
  }
}
