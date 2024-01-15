import 'package:flutter/material.dart';
import 'package:flutter_movie/res/colors/app_colors.dart';
import 'package:flutter_movie/res/strings/indonesia.strings.dart';
import 'package:flutter_movie/res/strings/strings.dart';

class Resources {
  final BuildContext context;

  Resources(this.context);

  AppColors get color {
    return AppColors();
  }

  Strings get strings {
    Locale locale = Localizations.localeOf(context);
    switch (locale.languageCode) {
      case "ind":
        return IndonesiaStrings();
      default:
        return IndonesiaStrings();
    }
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
