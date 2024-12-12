import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/color_pallete.dart';

class BaseTextStyle extends TextStyle {
  BaseTextStyle({
    String fontFamily = 'Poppins',
    TextDecoration decoration = TextDecoration.none,
    FontWeight? fontWeight,
    double? fontSize,
    double? height,
    Color? color,
  }) : super(
          fontWeight: fontWeight ?? FontWeight.w500,
          fontSize: fontSize ?? 16.0,
          decoration: decoration,
          // decorationStyle: TextDecorationStyle.solid,
          decorationColor: color ?? TextPallete.dark.color,
          fontFamily: fontFamily,
          color: color ?? TextPallete.dark.color,
        );
}

abstract class DefaultTypography {
  /// Default Typography with Poppins Font font size 14, font-weight medium, and height 1.25
  static TextStyle base = BaseTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  /// link Typography with Poppins Font font size 14 , font-weight medium, height 1.25 and link color
  static TextStyle link = BaseTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    // height: 0.11,
    color: TextPallete.link.color,
  );

  /// small with underline Typography with Poppins Font font size 14, height 1.25,  font-weight bold and underline
  static TextStyle smallBoldUnderline = BaseTextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 1.25,
    decoration: TextDecoration.underline,
  );

  /// button label Typography with Poppins Font font size 14, height 1.25, font-weight semi-bold and light color
  static TextStyle buttonLabel = BaseTextStyle(
    fontWeight: FontWeight.w600,
    color: TextPallete.light.color,
    fontSize: 14,
  );

  /// form label Typography with Poppins Font font size 16, height 1.25, and font-weight medium
  static TextStyle formLabel = BaseTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16,
    // height: 0.1,
  );

  static TextStyle title = BaseTextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    // height: 0.1,
  );

  /// form title Typography with Poppins Font font size 24, height 1.25, and font-weight medium
  static TextStyle formTitle = BaseTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24,
    // height: 0.06,
  );

  /// form error Typography with Poppins Font font size 12, height 1.25, font-weight medium, and danger color
  static TextStyle formError = BaseTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12,
    // height: 0.1,
    color: TextPallete.danger.color,
  );
  // body content Typography with Poppins Font font size 14, height 1.25, font-weight normal, and dark color
  static TextStyle bodyContent = BaseTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    // height: 0.1,
    // color: TextPallete.dark.color,
  );

  /// content message Typography with Poppins Font font size 14, height 1.25, font-weight normal, and message content color
  static TextStyle contentMessage = BaseTextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    // height: 0.1,
    color: TextPallete.messageContent.color,
  );

  /// label Typography with Poppins Font font size 10, height 1.25, font-weight medium, and message content color
  static TextStyle label = BaseTextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10,
  );
}
