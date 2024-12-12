import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/common/enum/screen_status.dart';
import 'package:test_boilerplate/app/common/utils/debouncer.dart';
import 'package:test_boilerplate/app/core/entities/sort_by.dart';

import '../organisms/filter_search_bar.dart';
import '../organisms/lazy_list_view.dart';
import '../themes/spacing.dart';

class ListViewWithFilterbar<T> extends StatelessWidget {
  final Function(String?)? onSearchChanged;
  final List<T>? items;
  final SortBy sortBy;
  final bool isMaxPage;
  final String noItemLabel;
  final Widget Function(BuildContext, T, int) buildItem;
  final Future<void> Function()? fetchDataCallback;
  final ScreenStatus screenState;
  final Function(T)? onTapItem;
  final Function(bool, T)? onToggleSelected;
  final bool selectable;
  final Future<void> Function()? refreshCallback;
  final void Function(SortBy)? onSortByChanged;

  const ListViewWithFilterbar({
    super.key,
    this.onSearchChanged,
    required this.items,
    required this.sortBy,
    required this.isMaxPage,
    required this.noItemLabel,
    required this.buildItem,
    this.fetchDataCallback,
    required this.screenState,
    this.onTapItem,
    this.onToggleSelected,
    this.selectable = false,
    this.refreshCallback,
    this.onSortByChanged,
  });

  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 300);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FilterSearchBar(
          onSortByChanged: onSortByChanged,
          onChanged: (value) {
            if (value == null) return;
            debouncer.run(() => onSearchChanged?.call(value));
          },
        ),
        Spacing.l,
        if (sortBy != SortBy.none)
          Column(
            children: [
              Row(
                children: [
                  Text(
                    'Menampilkan item yang ${sortBy.displayString}',
                    style: const TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Spacing.m,
            ],
          ),
        Expanded(
          child: LazyListView<T>(
            isMaxPage: isMaxPage,
            data: items,
            buildItem: buildItem,
            onRefresh: refreshCallback,
            fetchDataCallback: fetchDataCallback ?? () async {},
            screenState: screenState,
            noItemLabel: noItemLabel,
          ),
        ),
      ],
    );
  }
}
