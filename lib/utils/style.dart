import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/utils/responsive.dart';

TextStyle getBoldStyle(){
  return TextStyle(
    fontSize: getSize(14),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
}

 const Color greenColor = Color(0xff228c60);
  Color bgColor = Colors.black.withOpacity(0.1);
 const Color lightFont = Color(0xff949494);
 const Color darkFont = Color(0xff202420);
 const Color getShadowColor = Color(0xff0000000D);


TextStyle getRegularStyle(){
  return TextStyle(
    fontSize: getSize(14),
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
}