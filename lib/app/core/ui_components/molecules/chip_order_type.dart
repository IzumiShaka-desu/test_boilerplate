import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/entities/order_type.dart';

import '../themes/spacing.dart';

class ChipOrderType extends StatelessWidget {
  const ChipOrderType({
    super.key,
    required this.label,
    required this.color,
    required this.borderColor,
  });
  final String label;
  final Color color;
  final Color borderColor;

  factory ChipOrderType.fromOrderType({
    required OrderType orderType,
  }) {
    switch (orderType) {
      case OrderType.warehouse:
        return const ChipOrderType(
          label: 'Warehouse',
          color: Color(0xFFFFF6E6),
          borderColor: Color(0xFFA98D58),
        );
      case OrderType.generalTrade:
        return const ChipOrderType(
          label: 'General Trade',
          color: Color(0xFFD1EEE1),
          borderColor: Color(0xFF1BAA69),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: ShapeDecoration(
              color: borderColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          Spacing.xs,
          Text(
            label,
            style: TextStyle(
              color: borderColor,
              fontSize: 10,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.05,
            ),
          ),
        ],
      ),
    );
  }
}
