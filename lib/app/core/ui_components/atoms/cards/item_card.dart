import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/icons/svg_icons.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/spacing.dart';

class ItemCardData {
  final Widget? icon;
  final String title;
  final String subtitle;
  final String desc;
  final VoidCallback? onTap;
  final bool? isSelected;
  final void Function(bool?)? onChangeSelected;

  ItemCardData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.desc,
    this.onTap,
    this.isSelected,
    this.onChangeSelected,
  });
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.data,
  });

  final ItemCardData data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: data.onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: Color(0xFFEDEDED),
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: const Color(0x050A0A0A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(),
                    child: data.icon ?? SvgIcons.box(),
                  ),
                ],
              ),
            ),
            Spacing.s,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.subtitle,
                    style: const TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      padding: const EdgeInsets.only(right: 13.0),
                      child: Text(
                        data.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF0A0A0A),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    data.desc,
                    style: const TextStyle(
                      color: Color(0xFF616161),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            if (data.isSelected != null)
              Checkbox(
                value: data.isSelected,
                activeColor: Colors.green,
                onChanged: data.onChangeSelected,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: const BorderSide(
                  width: 1,
                  color: Color(0xFFC2C2C2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
