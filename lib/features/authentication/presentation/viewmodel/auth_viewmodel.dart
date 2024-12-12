import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:test_boilerplate/app/common/utils/app_state.dart';
import 'package:test_boilerplate/app/common/utils/failure.dart';
import 'package:test_boilerplate/features/authentication/domain/entities/user_profile.dart';

import '../../../../app/common/enum/screen_status.dart';
import '../../domain/entities/user_session.dart';
import '../../domain/usecases/authentication_usecases.dart';

class AuthViewmodel extends ChangeNotifier {
  final AuthUsecases _usecases;

  AuthViewmodel({
    required AuthUsecases usecases,
  }) : _usecases = usecases {
    listenToSession();
  }
  UserSession? _session;
  UserSession? get session => _session;

  AppState<UserProfile> _userProfileState = AppState();
  AppState<UserProfile> get userProfileState => _userProfileState;

  void fetchProfile() async {
    if (_userProfileState.isLoading) return;
    _userProfileState = _userProfileState.doLoading();
    notifyListeners();
    final result = await _usecases.fetchProfile();
    result.fold(
      (l) {
        _userProfileState = _userProfileState.copyWith(
          screenState: ScreenStatus.error,
          errorMessage: l.message,
        );
      },
      (r) {
        _userProfileState = _userProfileState.copyWith(
          screenState: ScreenStatus.success,
          data: r,
          errorMessage: null,
        );
      },
    );
    notifyListeners();
  }

  ValueListenable<UserSession?> get listenableSession => _usecases.listenableSession;

  void listenToSession() {
    debugPrint("listenToSession");
    _sessionListener();
    listenableSession.addListener(_sessionListener);
  }

  void _sessionListener() {
    final event = listenableSession.value;
    debugPrint("current event $event");
    if (event != _session) {
      _session = event;
      debugPrint("session changed $event");
      notifyListeners();
      fetchProfile();
    }
  }

  void cancelListenToSession() {
    listenableSession.removeListener(_sessionListener);
  }

  Future<void> login({
    required String email,
    required String password,
    void Function(String)? onSuccess,
    void Function(Failure)? onError,
  }) async {
    final result = await _usecases.login(
      email: email,
      password: password,
    );
    debugPrint("result $result");
    result.fold(
      (l) => onError?.call(l),
      (r) => onSuccess?.call(r),
    );
  }

  void logout() {
    _usecases.logout();
  }

  void forgotPassword({
    required String email,
    void Function(String)? onSuccess,
    void Function(Failure)? onError,
  }) async {
    final result = await _usecases.forgotPassword(
      email: email,
    );
    result.fold(
      (l) => onError?.call(l),
      (r) => onSuccess?.call(r),
    );
  }

  void resetPassword(
    String accessToken,
    String resfreshToken,
    String newPassword,
    void Function(String)? onSuccess,
    void Function(Failure)? onError,
  ) async {
    final result = await _usecases.resetPassword(
      accessToken: accessToken,
      resfreshToken: resfreshToken,
      newPassword: newPassword,
    );
    result.fold(
      (l) => onError?.call(l),
      (r) => onSuccess?.call(r),
    );
  }
}
