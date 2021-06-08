import 'package:flutter/material.dart';

@immutable
class UIconstants {
  final double defaultPads = 18.0;
  final double defaultsmallPads = 12.0;
  final double defaultIconPads = 5.5;
  final double defaultBorderWidth = 1.0;
  final Color defaultFontColor = Color.fromARGB(255, 20, 20, 20);
  final Color defaultBackGroundColor = Color.fromARGB(255, 234, 237, 239);
  final Color defaultPrimaryColor = Color.fromARGB(255, 9, 76, 114);
  final Color defaultDarkBackground = Color.fromARGB(255, 123, 138, 146);
  final Color defaultLinkColor = Color.fromARGB(255, 2, 73, 211);
  final Color defaultOnlineColor = Color.fromARGB(255, 9, 114, 100);
  final double defaultInputBorderRadius = 5.0;
  final double defaultButtonHeight = 50;

  Map<int, Color> defaultSwatch = {
    50: Color.fromRGBO(9, 76, 114, .1),
    100: Color.fromRGBO(9, 76, 114, .2),
    200: Color.fromRGBO(9, 76, 114, .3),
    300: Color.fromRGBO(9, 76, 114, .4),
    400: Color.fromRGBO(9, 76, 114, .5),
    500: Color.fromRGBO(9, 76, 114, .6),
    600: Color.fromRGBO(9, 76, 114, .7),
    700: Color.fromRGBO(9, 76, 114, .8),
    800: Color.fromRGBO(9, 76, 114, .9),
    900: Color.fromRGBO(9, 76, 114, 1),
  };
}
