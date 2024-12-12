import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/spacing.dart';

import '../../themes/color_pallete.dart';

class DetailInfoCard extends StatelessWidget {
  const DetailInfoCard({
    super.key,
    required this.title,
    required this.child,
  });
  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: ColorPallete.paper.color,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 16,
                  decoration: BoxDecoration(
                    color: ColorPallete.primaryBlue.color,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(4),
                      bottomRight: Radius.circular(4),
                    ),
                  ),
                ),
                Spacing.xs,
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF0A0A0A),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: child,
              ),
            )
          ],
        ),
      ),
    );
  }
}
