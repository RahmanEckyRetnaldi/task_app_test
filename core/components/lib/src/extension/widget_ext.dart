import 'package:flutter/material.dart';

extension WidgetMargin2 on Widget {
  Container margin({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Container(
      margin: EdgeInsets.only(
        left: left ?? 0,
        top: top ?? 0,
        right: right ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }

  Container marginAll(
    double margin,
  ) {
    return Container(
      margin: EdgeInsets.all(margin),
      child: this,
    );
  }

  Container topMargin(double height) {
    return Container(
      margin: EdgeInsets.only(top: height),
      child: this,
    );
  }

  Container leftMargin(double width) {
    return Container(
      margin: EdgeInsets.only(left: width),
      child: this,
    );
  }
}
