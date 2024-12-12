import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/color_pallete.dart';

import '../themes/typography.dart';

class BadgeStatus extends StatelessWidget {
  const BadgeStatus({
    super.key,
    required this.color,
    required this.lable,
  });
  factory BadgeStatus.fromStatus({
    required String status,
  }) {
    switch (status.toLowerCase()) {
      case 'active':
        return BadgeStatus.active();
      case 'unverified':
        return BadgeStatus.unverified();
      case 'waiting':
        return BadgeStatus.waiting();
      default:
        return BadgeStatus.active();
    }
  }
  factory BadgeStatus.active({
    String lable = 'Aktif',
  }) {
    return BadgeStatus(
      color: TextPallete.success.color,
      lable: lable,
    );
  }
  factory BadgeStatus.unverified({
    String lable = 'Belum Verifikasi',
  }) {
    return BadgeStatus(
      color: TextPallete.danger.color,
      lable: lable,
    );
  }
  factory BadgeStatus.waiting({
    String lable = 'Menunggu Verifikasi',
  }) {
    return BadgeStatus(
      color: TextPallete.warning.color,
      lable: lable,
    );
  }
  final Color color;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: ShapeDecoration(
        color: color.withOpacity(0.12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            lable,
            style: DefaultTypography.label.copyWith(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
