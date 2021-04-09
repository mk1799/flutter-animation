import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/Animation/animation_file.dart';
import 'package:flutter_animation/screens/Description.dart';
import 'package:flutter_animation/screens/clock/slide_countdown_clock.dart';
import 'package:flutter_animation/screens/clock/slide_direction.dart';
import 'package:flutter_animation/screens/linear_percent_indicator.dart';
import 'package:flutter_animation/screens/model/cardModel.dart';
import 'package:flutter_animation/utils/responsive.dart';
import 'package:flutter_animation/utils/style.dart';
import 'package:hexcolor/hexcolor.dart';

class Screen1 extends StatefulWidget {
  final String screencount;
  Screen1(this.screencount);
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> with SingleTickerProviderStateMixin {
  int cate = 0;
  List<CardModel> listOfCardModel = [];
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    ///Prepare datasource
    for (int i = 0; i < 10; i++) {
      CardModel cardModel = CardModel();
      cardModel.lable = "Hello beautiful ${i + 1}";
      cardModel.percentage = 42 + i;
      cardModel.price = 5200 + i * 13;
      cardModel.tag = "Community ${i + 1}";

      listOfCardModel.add(cardModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    image: AssetImage("asset/profile.jpg"),
                  ),
                ),
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
          padding: EdgeInsets.only(top: getSize(20), left: getSize(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AnimatedTextKit(
              //   animatedTexts: [
              //     FadeAnimatedText(
              //       'Fade First',
              //       textStyle:
              //           TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              //     ),
              //     ScaleAnimatedText(
              //       'Then Scale',
              //       textStyle:
              //           TextStyle(fontSize: 70.0, fontFamily: 'Canterbury'),
              //     ),
              //   ],
              // ),

            
              // Text("Discover",style: getBoldStyle().copyWith(
              //     fontSize: getFontSize(30),
              //   ),),
              AnimatedDefaultTextStyle(
                child: Text(
                  "Discover",
                  textAlign: TextAlign.left,
                ),
                duration: Duration(milliseconds: 1000),
                style: getBoldStyle().copyWith(
                  fontSize: getFontSize(30),
                ),
                curve: Curves.elasticOut,
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
                        onTap: () {
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
                              color: (cate == index)
                                  ? Colors.black
                                  : Colors.transparent),
                          child: Text(
                            "TRENDING",
                            style: getRegularStyle().copyWith(
                                color:
                                    (cate == index) ? Colors.white : lightFont),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: getSize(20)),
            child: ListView.builder(
              padding: EdgeInsets.only(top: getSize(20), left: getSize(20)),
              shrinkWrap: true,
              itemCount: listOfCardModel.length,
              itemBuilder: (BuildContext context, int index) {
                return getMainListViewItem(listOfCardModel[index]);
              },
            ),
          ),
        ),
      ],
    );
  }

  getMainListViewItem(CardModel cardModel) {
    return Padding(
      padding: EdgeInsets.only(bottom: getSize(50)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Description(
                cardModel: cardModel,
              ),
            ),
          );
        },
        child: Container(
          child: Stack(
            children: [
              ShowUp(
                delay: 500,
                x: 0,
                y: 2,
                child: Material(
                  elevation: 15.0,
                  child: Container(
                    // color: Colors.white,
                    width: getSize(230),
                    height: getSize(280),
                    child: Padding(
                      padding: EdgeInsets.all(getSize(5)),
                      child: Image.asset(
                        "asset/bg.jpg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: getSize(40),
                  right: 0,
                  child: ShowUp(
                    child: getCard(cardModel),
                    delay: 500,
                    x: 2,
                    y: 0,
                  ))
            ],
          ),
        ),
      ),
    );
  }

  getCard(CardModel cardModel) {
    return Hero(
      tag: cardModel.lable,
      child: Material(
        elevation: 15.0,
        child: Container(
          color: Colors.white,
          width: getSize(220),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getSize(15), vertical: getSize(25)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cardModel.tag.toUpperCase(),
                  style: getRegularStyle().copyWith(
                    fontSize: getSize(10),
                    color: HexColor("#a83242"),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: getSize(6),
                ),
                RichText(
                  text: TextSpan(
                      text: cardModel.lable.toUpperCase(),
                      style: getBoldStyle().copyWith(
                        fontSize: getSize(18),
                      ),
                      children: [
                        TextSpan(
                          text: ".",
                          style: TextStyle(
                              color: HexColor("#f09516"),
                              fontSize: getSize(20)),
                        )
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: getSize(10)),
                  child: Divider(),
                ),
                Text(
                  "We're helping women and girls their self-confidence",
                  style: getRegularStyle().copyWith(
                    fontSize: getSize(10),
                  ),
                ),
                SizedBox(
                  height: getSize(15),
                ),
                LinearPercentIndicator(
                  percent: cardModel.percentage / 100,
                  progressColor: HexColor("#228c60"),
                  lineHeight: getSize(2),
                  linearStrokeCap: LinearStrokeCap.butt,
                  animation: true,
                  // animationDuration: 500,
                ),
                SizedBox(
                  height: getSize(15),
                ),
                Row(
                  children: [
                    Text(
                      "${cardModel.percentage}%",
                      style: getBoldStyle().copyWith(
                        fontSize: getSize(15),
                      ),
                    ),
                    SizedBox(
                      width: getSize(6),
                    ),
                    Text(
                      "funded",
                      style: getRegularStyle().copyWith(
                          color: HexColor("#777a80"), fontSize: getSize(12)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
