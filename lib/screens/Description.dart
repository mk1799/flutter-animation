import 'package:flutter/material.dart';
import 'package:flutter_animation/utils/responsive.dart';
import 'package:hexcolor/hexcolor.dart';

class Description extends StatefulWidget {
  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: getSize(
              300,
            ),
            child: FittedBox(
              child: Image.asset("asset/bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: getSize(
              10,
            ),
            child: Container(
              width: getSize(
                200,
              ),
              height: getSize(
                200,
              ),
              child: Padding(
                padding: EdgeInsets.all(
                  getSize(
                    15,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Community".toUpperCase(),
                      style: TextStyle(
                          fontSize: getSize(
                            16,
                          ),
                          color: HexColor("#a83242")),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
