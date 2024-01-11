import 'package:flutter/material.dart';
import 'package:flutter_movie/res/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
