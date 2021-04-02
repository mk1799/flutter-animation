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

TextStyle getRegularStyle(){
  return TextStyle(
    fontSize: getSize(14),
    color: Colors.black,
    fontWeight: FontWeight.normal,
  );
}