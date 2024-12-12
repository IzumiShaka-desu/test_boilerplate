import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/atoms/cards/info_card.dart';
import 'package:test_boilerplate/app/core/ui_components/molecules/preview_section_card.dart';
import 'package:test_boilerplate/app/core/ui_components/themes/spacing.dart';

import '../atoms/cards/item_card.dart';

class PreviewWidgetData<T> {
  final String totalCount;
  final String totalLabel;
  final bool isTotalCountLoading;
  final List<CategoryPreviewWidgetData> categoriesData;
  final List<SectionPreviewItemData<T>> sectionsData;
  PreviewWidgetData({
    this.isTotalCountLoading = false,
    required this.totalCount,
    required this.totalLabel,
    required this.categoriesData,
    required this.sectionsData,
  });
}

class SectionPreviewItemData<T> {
  String title;
  List<T> items;
  ItemCardData Function(T) itemDataBuilder;
  VoidCallback? onTapSubtitle;
  final bool isLoading;
  SectionPreviewItemData({
    required this.title,
    required this.items,
    required this.itemDataBuilder,
    this.onTapSubtitle,
    this.isLoading = false,
  });
}

class CategoryPreviewWidgetData {
  final String count;
  final String label;
  final bool isLoading;
  CategoryPreviewWidgetData({
    this.isLoading = false,
    required this.count,
    required this.label,
  });
}

class PreviewWidget<T> extends StatelessWidget {
  const PreviewWidget({
    super.key,
    required this.data,
  });
  final PreviewWidgetData<T> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InfoCard(
                sticky: true,
                isLoading: data.isTotalCountLoading,
                label: data.totalLabel,
                value: data.totalCount,
              ),
            ],
          ),
          Row(
            children: data.categoriesData
                .take(4)
                .map(
                  (e) => InfoCard(
                    sticky: true,
                    isLoading: e.isLoading,
                    label: e.label,
                    value: e.count,
                  ),
                )
                .toList(),
          ),
          Spacing.xs,
          Column(
            mainAxisSize: MainAxisSize.min,
            children: data.sectionsData
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: PreviewSectionCard<T>(
                      title: e.title,
                      noItemLabel: "${e.title} tidak tersedia",
                      items: e.items,
                      itemDataBuilder: e.itemDataBuilder,
                      onTapSubtitle: e.onTapSubtitle,
                      isLoading: e.isLoading,
                    ),
                  ),
                )
                .toList(),
          ),
          Spacing.s,
        ],
      ),
    );
  }
}
