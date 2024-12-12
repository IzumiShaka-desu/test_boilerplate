import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/core/ui_components/molecules/boucing_background.dart';

import '../themes/color_pallete.dart';
import '../themes/typography.dart';

class HeaderConfig {
  final Widget header;

  const HeaderConfig._internal({
    required this.header,
  });

  static Widget _buildHeaderLayout({
    required Widget child,
    required double aspectRatio,
    Color backgroundColor = const Color(0xFF1D8ADB),
  }) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(color: backgroundColor),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  return BouncingBox2(
                    maxHeight: constraints.maxHeight,
                    maxWidth: constraints.maxWidth,
                  );
                },
              ),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }

  factory HeaderConfig.defaultPage({
    required String title,
    VoidCallback? onBackButtonPressed,
  }) {
    return HeaderConfig._internal(
      header: _buildHeaderLayout(
        aspectRatio: 375 / 90,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(
                    color: ColorPallete.whiteSwan.color,
                    onPressed: onBackButtonPressed,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: DefaultTypography.title.copyWith(
                        color: ColorPallete.whiteSwan.color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  factory HeaderConfig.mainPage({
    required Widget headerContent,
  }) {
    return HeaderConfig._internal(
      header: _buildHeaderLayout(
        child: headerContent,
        aspectRatio: 375 / 123,
      ),
    );
  }
}

class DefaultScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final bool isLoading;
  final HeaderConfig headerConfig;

  const DefaultScaffold({
    super.key,
    this.body,
    this.floatingActionButton,
    this.drawer,
    this.bottomNavigationBar,
    this.isLoading = false,
    required this.headerConfig,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Header with BouncingBox2 background and title
          headerConfig.header,
          Expanded(
            child: isLoading ? const Center(child: CircularProgressIndicator()) : body ?? const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
