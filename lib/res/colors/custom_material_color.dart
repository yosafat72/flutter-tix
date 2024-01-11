import 'package:flutter/material.dart';

class CustomMaterialColor {
  final int red;
  final int green;
  final int blue;

  CustomMaterialColor(this.red, this.green, this.blue);

  MaterialColor get rgbColor {
    Map<int, Color> color = {
      50: Color.fromRGBO(red, green, blue, .1),
      100: Color.fromRGBO(red, green, blue, .2),
      200: Color.fromRGBO(red, green, blue, .3),
      300: Color.fromRGBO(red, green, blue, .4),
      400: Color.fromRGBO(red, green, blue, .5),
      500: Color.fromRGBO(red, green, blue, .6),
      600: Color.fromRGBO(red, green, blue, .7),
      700: Color.fromRGBO(red, green, blue, .8),
      800: Color.fromRGBO(red, green, blue, .9),
      900: Color.fromRGBO(red, green, blue, 1),
    };
    return MaterialColor(Color.fromRGBO(red, green, blue, 1).value, color);
  }
}
