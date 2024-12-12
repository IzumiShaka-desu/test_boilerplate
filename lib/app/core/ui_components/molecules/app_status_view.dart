import 'package:flutter/material.dart';
import 'package:test_boilerplate/app/common/enum/screen_status.dart';
import 'package:test_boilerplate/app/common/utils/app_state.dart';

class AppStateView extends StatelessWidget {
  const AppStateView({
    super.key,
    required this.appState,
    this.onRetry,
    this.isLastPage = false,
  });
  final AppState appState;
  final bool isLastPage;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    switch (appState.screenState) {
      case ScreenStatus.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case ScreenStatus.error:
        //  error with retry button
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Error"),
            const Text("Please try again"),
            ElevatedButton(
              onPressed: () {
                onRetry?.call();
              },
              child: const Text("Retry"),
            ),
          ],
        );
      default:
        // vew for load more (if this component used in list view trigger load more)
        if (isLastPage) {
          return const SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("No more data"),
                ),
              ],
            ),
          );
        }
        return const SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Load More"),
              ),
            ],
          ),
        );
    }
  }
}
