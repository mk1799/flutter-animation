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

 const Color greenColor = Color(0xff287d39);
 const Color bgColor = Color(0xfff2f2f2);
 const Color lightFont = Color(0xff949494);
 const Color darkFont = Color(0xff202420);


TextStyle getRegularStyle(){
  return TextStyle(
    fontSize: getSize(14),
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
}