import 'package:flutter/material.dart';
import 'package:flutter_movie/res/colors/app_colors.dart';

class Resources {
  final BuildContext context;

  Resources(this.context);

  AppColors get color {
    return AppColors();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
