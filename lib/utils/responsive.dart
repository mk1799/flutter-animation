import 'package:flutter/material.dart';
import 'package:flutter_animation/utils/style.dart';

import '../main.dart';

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

dynamic getSize(double px) {
  return px *
      ((MathUtilities.screenWidth(globalKey.currentState.overlay.context)) / 414);
}

dynamic getFontSize(double px) {
  return px *
          (MathUtilities.screenWidth(globalKey.currentState.overlay.context) / 414) +
      2;
}

dynamic getPercentageWidth(double percentage) {
  return MathUtilities.screenWidth(globalKey.currentState.overlay.context) *
      percentage /
      100;
}

class MathUtilities {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static safeAreaTopHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static safeAreaBottomHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;
}
class VerticalText extends StatelessWidget {
  String name;
  bool checked;
  GlobalKey globalKey;

  VerticalText(this.name, this.globalKey, this.checked);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      key: globalKey,
      quarterTurns: 3,
      child: Text(
        name,
        textAlign: TextAlign.left,
        style: getRegularStyle().copyWith( color: checked ? darkFont : lightFont,fontWeight: FontWeight.w500)
      ),
    );
  }
}