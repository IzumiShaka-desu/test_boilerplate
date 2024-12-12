import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/color_pallete.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/spacing.dart';

/// this class will provide a dialog with a title and a message
class Dialogs {
  static Future<void> danger(
    BuildContext context,
    String title,
    String message, {
    VoidCallback? onConfirm,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          icon: SvgPicture.asset(
            "assets/svg/ion_warning.svg",
            width: 80,
            height: 80,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(message),
                Spacing.xl,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.primaryBlue.color,
                          foregroundColor: ColorPallete.paper.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          onConfirm?.call();
                        },
                        child: const Text("Ok"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> success(
    BuildContext context,
    String title,
    String message, {
    VoidCallback? onConfirm,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          icon: SvgPicture.asset(
            "assets/svg/Approve.svg",
            width: 80,
            height: 80,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(message),
                Spacing.xl,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.primaryBlue.color,
                          foregroundColor: ColorPallete.paper.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          onConfirm?.call();
                        },
                        child: const Text("Ok"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> confirm(
    BuildContext context,
    String title,
    String message,
    Function onConfirm,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          icon: SvgPicture.asset(
            "assets/svg/ion_warning.svg",
            width: 80,
            height: 80,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                    child: Text(
                  message,
                  textAlign: TextAlign.center,
                )),
                Spacing.xl,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: ColorPallete.disabled.color,
                          backgroundColor: ColorPallete.paper.color,
                          side: BorderSide(
                            color: ColorPallete.disabled.color,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          surfaceTintColor: ColorPallete.paper.color,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Kembali"),
                      ),
                    ),
                    Spacing.xs,
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.primaryBlue.color,
                          foregroundColor: ColorPallete.paper.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          onConfirm();
                        },
                        child: const Text("Ya, Batalkan"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> confirmNew(
    BuildContext context,
    String title,
    String message,
    Function onConfirm,
  ) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          icon: SvgPicture.asset(
            "assets/svg/ion_quest_mark.svg",
            width: 80,
            height: 80,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Center(
                    child: Text(
                  message,
                  textAlign: TextAlign.center,
                )),
                Spacing.xl,
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: ColorPallete.disabled.color,
                          backgroundColor: ColorPallete.paper.color,
                          side: BorderSide(
                            color: ColorPallete.disabled.color,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          surfaceTintColor: ColorPallete.paper.color,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Batalkan"),
                      ),
                    ),
                    Spacing.xs,
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.primaryBlue.color,
                          foregroundColor: ColorPallete.paper.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          onConfirm();
                        },
                        child: const Text("Ya, Pilih"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
