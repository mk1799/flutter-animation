import 'package:flutter/material.dart';
import 'package:flutter_animation/screens/clock/slide_countdown_clock.dart';
import 'package:flutter_animation/screens/clock/slide_direction.dart';
import 'package:flutter_animation/screens/linear_percent_indicator.dart';
import 'package:flutter_animation/utils/responsive.dart';
import 'package:flutter_animation/utils/style.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Duration _duration = Duration(seconds: 1000000);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#fcf5f6"),
      body: ListView(
        children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              SizedBox(
                width: double.infinity,
                height: getSize(300),
                child: FittedBox(
                  child: Image.asset("asset/bg.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                top: getSize(180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.white,
                      width: getSize(380),
                      child: Padding(
                        padding: EdgeInsets.all(
                          getSize(30),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Community".toUpperCase(),
                              style: getRegularStyle().copyWith(
                                fontSize: getSize(16),
                                color: HexColor("#a83242"),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: getSize(3),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Hello beautiful".toUpperCase(),
                                  style: getBoldStyle().copyWith(
                                    fontSize: getSize(25),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ".",
                                      style: TextStyle(
                                          color: HexColor("#f09516"),
                                          fontSize: getSize(35)),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              height: getSize(8),
                            ),
                            SlideCountdownClock(
                              duration: Duration(days: 20, minutes: 1000),
                              slideDirection: SlideDirection.Up,
                              separator: ":",
                              textStyle: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor("#e6e5e3"),
                              ),
                              shouldShowDays: false,
                              onDone: () {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Clock 1 finished')));
                              },
                            ),
                            SizedBox(
                              height: getSize(40),
                            ),
                            LinearPercentIndicator(
                              percent: 0.4,
                              progressColor: HexColor("#228c60"),
                              lineHeight: getSize(6),
                              linearStrokeCap: LinearStrokeCap.butt,
                              animation: true,
                              animationDuration: 500,
                            ),
                            SizedBox(
                              height: getSize(20),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "\$5200",
                                    style: getBoldStyle().copyWith(
                                      fontSize: getSize(25),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "Raised of \$7,000 goals",
                                    style: getRegularStyle().copyWith(
                                      color: HexColor("#777a80"),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "124 donors",
                                    style: getRegularStyle().copyWith(
                                      color: HexColor("#777a80"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: getSize(20),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.red,
                      padding: EdgeInsets.symmetric(
                          vertical: getSize(15), horizontal: getSize(30)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ABOUT".toUpperCase(),
                            style: getBoldStyle().copyWith(
                                fontSize: getSize(20),
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: getSize(20),
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen",
                            textAlign: TextAlign.justify,
                            style: getRegularStyle()
                                .copyWith(fontSize: getSize(14)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
