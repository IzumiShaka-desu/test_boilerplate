import '../enum/screen_status.dart';

///
class AppState<T> {
  final ScreenStatus screenState;
  final String? errorMessage;
  final T? data;
  bool get isLoading => screenState == ScreenStatus.loading;
  bool get isError => screenState == ScreenStatus.error;
  bool get isSuccess => screenState == ScreenStatus.success;
  AppState({
    this.screenState = ScreenStatus.initial,
    this.errorMessage,
    this.data,
  });
  AppState<T> doLoading() {
    return copyWith(screenState: ScreenStatus.loading);
  }

  AppState<T> copyWith({
    ScreenStatus? screenState,
    String? errorMessage,
    T? data,
  }) {
    return AppState(
      screenState: screenState ?? this.screenState,
      errorMessage: errorMessage ?? this.errorMessage,
      data: data ?? this.data,
    );
  }
}

enum AppStatus {
  // initial,
  authenticated,
  unauthenticated,
}
