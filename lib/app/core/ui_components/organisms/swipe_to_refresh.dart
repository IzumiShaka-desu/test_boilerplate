import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwipeToRefresh extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final List<Widget> children;
  final bool useCupertinoIndicator;

  const SwipeToRefresh({
    super.key,
    required this.onRefresh,
    required this.children,
    this.useCupertinoIndicator = true, // Defaults to Cupertino for iOS
  });

  @override
  Widget build(BuildContext context) {
    // Choose the appropriate indicator based on the platform or user preference
    if (useCupertinoIndicator) {
      return CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: onRefresh,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => children[index],
              childCount: children.length,
            ),
          ),
        ],
      );
    } else {
      return RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView(
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(),
          children: children,
        ),
      );
    }
  }
}

class RefreshControlExample extends StatefulWidget {
  const RefreshControlExample({super.key});

  @override
  State<RefreshControlExample> createState() => _RefreshControlExampleState();
}

class _RefreshControlExampleState extends State<RefreshControlExample> {
  List<Color> colors = <Color>[
    CupertinoColors.systemYellow,
    CupertinoColors.systemOrange,
    CupertinoColors.systemPink,
  ];
  List<Widget> items = <Widget>[
    Container(color: CupertinoColors.systemPink, height: 100.0),
    Container(color: CupertinoColors.systemOrange, height: 100.0),
    Container(color: CupertinoColors.systemYellow, height: 100.0),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      slivers: <Widget>[
        CupertinoSliverRefreshControl(
          onRefresh: () async {
            await Future<void>.delayed(
              const Duration(milliseconds: 1000),
            );
            setState(() {
              items.insert(
                0,
                Container(color: colors[items.length % 3], height: 100.0),
              );
            });
          },
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => items[index],
            childCount: items.length,
          ),
        ),
      ],
    );
  }
}
