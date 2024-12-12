import 'package:flutter/material.dart';

import 'default_tab.dart';

class TabItem {
  final String title;
  final Color tabColor;
  final Color indicatorColor;
  final Color labelColor;

  const TabItem({
    required this.title,
    required this.tabColor,
    required this.indicatorColor,
    required this.labelColor,
  });
}

class KhonicTabBar extends StatelessWidget {
  final TabController controller;
  final List<TabItem> tabItems;
  final bool isScrollable;
  final Color? unselectedColor;

  const KhonicTabBar({
    super.key,
    required this.controller,
    required this.tabItems,
    this.unselectedColor,
    this.isScrollable = true,
  })  : assert(
          tabItems.length > 0,
          'The number of tabs must be greater than 0',
        ),
        assert(
          tabItems.length == controller.length,
          'The number of tabs must be equal to the length of the TabController',
        );
  List<Widget> get tabs {
    List<Widget> tabs = [];
    for (int i = 0; i < tabItems.length; i++) {
      tabs.add(KhonicTab(
        isActive: controller.index == i,
        color: tabItems[i].tabColor,
        title: tabItems[i].title,
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: TabBar(
        controller: controller,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.center,
        isScrollable: isScrollable,
        indicator: ShapeDecoration(
          color: tabItems[controller.index].indicatorColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        splashBorderRadius: BorderRadius.zero,
        labelColor: tabItems[controller.index].labelColor,
        unselectedLabelColor: unselectedColor,
        dividerHeight: 0,
        tabs: tabs,
      ),
    );
  }
}
