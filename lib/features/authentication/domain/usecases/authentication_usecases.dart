import 'package:flutter/foundation.dart';
import 'package:test_boilerplate/features/authentication/domain/entities/user_profile.dart';

import '../../../../app/common/utils/type_definition.dart';
import '../entities/user_session.dart';
import '../repositories/authentication_repository.dart';

class AuthUsecases {
  final AuthRepository _repository;
  AuthUsecases({required AuthRepository repository}) : _repository = repository;
  ValueListenable<UserSession?> get listenableSession => _repository.listenableSession;
  Future<FailOr<String>> login({
    required String email,
    required String password,
  }) =>
      _repository.login(email: email, password: password);
  void logout() => _repository.logout();
  Future<FailOr<String>> forgotPassword({
    required String email,
  }) =>
      _repository.forgotPassword(email: email);
  Future<FailOr<String>> resetPassword({
    required String accessToken,
    required String resfreshToken,
    required String newPassword,
  }) =>
      _repository.resetPassword(
        accessToken: accessToken,
        resfreshToken: resfreshToken,
        newPassword: newPassword,
      );

  Future<FailOr<UserProfile>> fetchProfile() async {
    return await _repository.fetchProfile();
  }
}
