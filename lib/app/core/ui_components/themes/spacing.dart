import 'package:flutter/material.dart';

abstract class Spacing {
  /// create spacing 2px
  static const Widget tiny = SizedBox(width: 2, height: 2);

  /// create spacing 4px
  static const Widget xxs = SizedBox(width: 4, height: 4);

  /// create spacing 8px
  static const Widget xs = SizedBox(width: 8, height: 8);

  /// create spacing 12px
  static const Widget s = SizedBox(width: 12, height: 12);

  /// create spacing 16px
  static const Widget m = SizedBox(width: 16, height: 16);

  /// create spacing 20px
  static const Widget l = SizedBox(width: 20, height: 20);

  /// create spacing 24px
  static const Widget xl = SizedBox(width: 24, height: 24);

  /// create spacing 28px
  static const Widget xxl = SizedBox(width: 28, height: 28);

  /// create spacing 32px
  static const Widget huge = SizedBox(width: 32, height: 32);
}
