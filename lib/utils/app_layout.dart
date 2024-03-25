import 'package:flutter/widgets.dart';

class AppLayout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(double pixel, BuildContext context) {
    double x = getScreenHeight(context) / pixel;
    return getScreenHeight(context) / x;
  }

  static getWidth(double pixel, BuildContext context) {
    double x = getScreenWidth(context) / pixel;
    return getScreenWidth(context) / x;
  }
}