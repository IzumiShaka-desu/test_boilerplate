import 'package:flutter/material.dart';

import '../../core/ui_components/atoms/icons/svg_icons.dart';
import '../../core/ui_components/themes/color_pallete.dart';
import '../../core/ui_components/themes/spacing.dart';

enum SnackbarType { success, danger, info }

/// extension for build context
extension BuildContextExt on BuildContext {
  // mediaquery
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  TextScaler get textScaleFactor => MediaQuery.of(this).textScaler;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;
  EdgeInsets get systemGestureInsets => MediaQuery.of(this).systemGestureInsets;
  // texttheme
  TextTheme get textTheme => Theme.of(this).textTheme;
  // font configuration
  TextTheme get primaryTextTheme => Theme.of(this).primaryTextTheme;
  TextStyle? get bodyLarge => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get bodyMedium => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get bodySmall => Theme.of(this).textTheme.bodySmall;
  TextStyle? get headlineLarge => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get headlineMedium => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get headlineSmall => Theme.of(this).textTheme.headlineSmall;
  TextStyle? get displayLarge => Theme.of(this).textTheme.displayLarge;
  TextStyle? get displayMedium => Theme.of(this).textTheme.displayMedium;
  TextStyle? get displaySmall => Theme.of(this).textTheme.displaySmall;
  TextStyle? get labelLarge => Theme.of(this).textTheme.labelLarge;
  TextStyle? get labelMedium => Theme.of(this).textTheme.labelMedium;
  TextStyle? get labelSmall => Theme.of(this).textTheme.labelSmall;
  TextStyle? get titleLarge => Theme.of(this).textTheme.titleLarge;
  TextStyle? get titleMedium => Theme.of(this).textTheme.titleMedium;
  TextStyle? get titleSmall => Theme.of(this).textTheme.titleSmall;

  // color
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Color get primaryColor => Theme.of(this).primaryColor;
  Color get primaryColorLight => Theme.of(this).primaryColorLight;
  Color get primaryColorDark => Theme.of(this).primaryColorDark;
  Color get canvasColor => Theme.of(this).canvasColor;
  Color get cardColor => Theme.of(this).cardColor;

  // scaffold
  Color get scaffoldBackgroundColor => Theme.of(this).scaffoldBackgroundColor;
  ScaffoldMessengerState ofScaffoldMessenger() => ScaffoldMessenger.of(this);

  void showSnackbar(String message, {SnackbarType type = SnackbarType.info}) {
    Color backgroundColor;
    Color textColor;
    Widget icon;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = const Color(0xFFF1FFEE);
        textColor = TextPallete.success.color;
        icon = SvgIcons.approve(size: 16);
        break;
      case SnackbarType.danger:
        backgroundColor = const Color(0xFFFFEDEB);
        textColor = TextPallete.danger.color;
        icon = SvgIcons.closeCircle(
          size: 16,
        );
        break;
      case SnackbarType.info:
      default:
        backgroundColor = const Color(0xFFF5F5F5); // replace with your desired color
        textColor = const Color(0xFF616161); // replace with your desired color
        icon = SvgIcons.approve(
          color: const Color(0xFF616161),
          size: 16,
        ); // replace with your desired icon
        break;
    }

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            icon,
            Spacing.xs,
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(bottom: 72, left: 16, right: 16),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  void showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            SvgIcons.approve(
              size: 16,
            ),
            Spacing.xs,
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: TextPallete.success.color,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(bottom: 72, left: 16, right: 16),
        backgroundColor: const Color(0xFFF1FFEE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }

  void showDangerSnackbar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            SvgIcons.closeCircle(),
            Spacing.xs,
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: TextPallete.danger.color,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: const EdgeInsets.only(bottom: 72, left: 16, right: 16),
        backgroundColor: const Color(0xFFFFEDEB),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}
