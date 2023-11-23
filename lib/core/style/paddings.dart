import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Paddings {
  // vertical
  static const EdgeInsets vertical12 = EdgeInsets.symmetric(vertical: 12.0);

  // horizontal
  static const EdgeInsets horizontal22 = EdgeInsets.symmetric(horizontal: 22.0);

  // mixed
  static const EdgeInsets vertica4horizontal8 = EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0);
  static const EdgeInsets vertica12horizontal22 = EdgeInsets.symmetric(vertical: 12.0, horizontal: 22.0);

  // all
  static const EdgeInsets all8 = EdgeInsets.all(8.0);
}
