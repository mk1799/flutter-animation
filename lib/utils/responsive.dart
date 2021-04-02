import 'package:flutter/cupertino.dart';

dynamic getSize(double px, BuildContext context) {
  return px * (MediaQuery.of(context).size.width / 414);
}
