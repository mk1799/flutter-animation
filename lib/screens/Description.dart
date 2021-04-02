import 'package:flutter/material.dart';
import 'package:flutter_animation/utils/responsive.dart';

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
            height: getSize(300, context),
            child: FittedBox(
              child: Image.asset("asset/bg.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          // Postis
        ],
      ),
    );
  }
}
