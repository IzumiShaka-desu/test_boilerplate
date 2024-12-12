import 'package:flutter/foundation.dart';
import 'package:test_boilerplate/features/authentication/domain/entities/user_profile.dart';
import 'package:test_boilerplate/features/authentication/domain/entities/user_session.dart';

import '../../../../app/common/utils/type_definition.dart';

abstract class AuthRepository {
  ValueListenable<UserSession?> get listenableSession;
  Future<FailOr<String>> login({
    required String email,
    required String password,
  });
  void logout();
  Future<FailOr<String>> forgotPassword({
    required String email,
  });
  Future<FailOr<String>> resetPassword({
    required String accessToken,
    required String resfreshToken,
    required String newPassword,
  });

  Future<FailOr<UserProfile>> fetchProfile();
}
