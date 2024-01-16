import 'package:flutter/material.dart';
import 'package:flutter_movie/res/colors/base_colors.dart';
import 'package:flutter_movie/res/colors/custom_material_color.dart';
import 'package:hexcolor/hexcolor.dart';

class AppColors implements BaseColors {
  @override
  MaterialColor get accentColor => CustomMaterialColor(144, 206, 161).rgbColor;

  @override
  MaterialColor get primaryColor => CustomMaterialColor(13, 37, 63).rgbColor;

  @override
  MaterialColor get secondaryColor => CustomMaterialColor(1, 180, 228).rgbColor;

  @override
  Color get darkBlue => HexColor("#0d253f");

  @override
  Color get lightBlue => HexColor("#01b4e4");

  @override
  Color get lightGreen => HexColor("#90cea1");

  @override
  Color get nobel => HexColor("#9A9A9A");
}
