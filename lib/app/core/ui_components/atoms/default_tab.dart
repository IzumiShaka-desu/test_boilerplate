import 'package:flutter/material.dart';

class KhonicTab extends StatelessWidget {
  final bool isActive;
  final Color color;
  final String title;

  const KhonicTab({
    super.key,
    required this.isActive,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
      child: Tab(
        child: Row(
          children: [
            if (isActive)
              Container(
                width: 8,
                height: 8,
                decoration: ShapeDecoration(
                  color: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            const SizedBox(width: 4), // Replace Spacing.xs
            Text(title),
          ],
        ),
      ),
    );
  }
}
