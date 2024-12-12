import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/common/enum/screen_status.dart';
import 'package:test_boilerplate/app/common/extension/extension.dart';
import 'package:test_boilerplate/app/common/utils/debouncer.dart';

import '../atoms/no_item_view.dart';

class LazyListView<T> extends StatefulWidget {
  const LazyListView({
    super.key,
    required this.data,
    required this.isMaxPage,
    required this.fetchDataCallback,
    required this.buildItem,
    required this.screenState,
    required this.noItemLabel,
    this.onRefresh,
  });

  final List<T>? data;
  final bool isMaxPage;
  final Future<void> Function() fetchDataCallback;
  final Widget Function(BuildContext context, T item, int index) buildItem;
  final ScreenStatus screenState;
  final String noItemLabel;
  final Future<void> Function()? onRefresh;

  @override
  State<LazyListView> createState() => _LazyListViewState<T>();
}

class _LazyListViewState<T> extends State<LazyListView<T>> {
  late final ScrollController _scrollController;
  final debouncer = Debouncer(milliseconds: 300);
  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;

    return SizedBox(
      height: MediaQuery.of(context).size.height, // or any fixed height
      child: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          CupertinoSliverRefreshControl(
            onRefresh: widget.onRefresh,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildItem(context, index, data),
              childCount: (data?.length ?? 0) + 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildItem(BuildContext context, int index, List<T>? data) {
    final isLastIndex = index == (data?.length ?? 0);
    if (isLastIndex) {
      if (widget.screenState == ScreenStatus.success && (data?.isEmpty ?? true)) {
        return Center(
          child: FutureBuilder<void>(
            future: widget.isMaxPage ? null : Future.delayed(100.ms, widget.fetchDataCallback),
            builder: (context, snapshot) {
              return NoItemView(label: widget.noItemLabel);
            },
          ),
        );
      }
      switch (widget.screenState) {
        case ScreenStatus.success:
          return widget.isMaxPage
              ? const SizedBox()
              : Center(
                  child: FutureBuilder<void>(
                    future: Future.delayed(100.ms, widget.fetchDataCallback),
                    builder: (context, snapshot) {
                      return const CircularProgressIndicator();
                    },
                  ),
                );
        case ScreenStatus.error:
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  "Error occurred", // Customize the error message as needed
                  style: TextStyle(
                    color: Color(0xFF0A0A0A),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: widget.fetchDataCallback,
                icon: const Icon(Icons.refresh_outlined),
                label: const Text("Try again"),
              ),
              const SizedBox(height: 20),
            ],
          );
        case ScreenStatus.loading:
        case ScreenStatus.initial:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    } else {
      final item = data![index];
      return widget.buildItem(context, item, index);
    }
  }
}
