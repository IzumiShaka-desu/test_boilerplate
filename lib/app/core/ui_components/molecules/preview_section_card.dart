import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/cards/item_card.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/spacing.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/no_item_view.dart';

class PreviewSectionCard<T> extends StatelessWidget {
  const PreviewSectionCard({
    super.key,
    this.noItemLabel = "No items available",
    required this.items,
    required this.itemDataBuilder,
    this.subtitle = 'Lihat Semua',
    required this.title,
    this.onTapSubtitle,
    this.isLoading = false,
  });
  final bool isLoading;
  final String title;
  final String subtitle;
  final VoidCallback? onTapSubtitle;
  final List<T> items;
  final String noItemLabel;
  final ItemCardData Function(T) itemDataBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Color(0xFF0A0A0A),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
            if (items.isNotEmpty && !isLoading)
              InkWell(
                onTap: onTapSubtitle,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF1D8ADB),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
          ],
        ),
        Spacing.m,
        if (isLoading) ...[
          Spacing.m,
          const CircularProgressIndicator(),
        ] else if (items.isEmpty) ...[
          Spacing.m,
          NoItemView(
            label: noItemLabel,
          )
        ] else ...[
          ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = itemDataBuilder(items[index]);
              return ItemCard(
                data: item,
              );
            },
          )
        ],
      ],
    );
  }
}
