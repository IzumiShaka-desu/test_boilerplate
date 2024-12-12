import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/color_pallete.dart';

class PrimaryButton extends MaterialButton {
  PrimaryButton({
    super.key,
    required super.onPressed,
    super.child,
    EdgeInsets? padding = const EdgeInsets.symmetric(
      vertical: 12,
    ),
    Color? color,
  }) : super(
          color: color ?? ColorPallete.primaryBlue.color,
          textColor: TextPallete.light.color,
          padding: padding,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        );
}
