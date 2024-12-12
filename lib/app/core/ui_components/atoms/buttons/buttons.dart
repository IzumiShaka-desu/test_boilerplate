import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/buttons/base_button.dart';

import '../../themes/typography.dart';

abstract class Buttons {
  static Widget primary({
    required String text,
    Widget? icon,
    required Function() onPressed,
    bool isDisabled = false,
    Color? color,
    EdgeInsets? padding,
  }) {
    return PrimaryButton(
      onPressed: isDisabled ? null : onPressed,
      color: color,
      padding: padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon,
          Text(
            text,
            style: DefaultTypography.buttonLabel,
          ),
        ],
      ),
    );
  }
}
