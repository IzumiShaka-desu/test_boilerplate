import 'package:dio/dio.dart';
import 'package:test_boilerplate/features/authentication/data/models/login_response.dart';
import 'package:test_boilerplate/features/authentication/data/models/user_profile_response.dart';

import '../../../../app/core/data/models/session_model.dart';

class RemoteAuthDatasource {
  final Dio _client;

  RemoteAuthDatasource({
    required Dio client,
  }) : _client = client;

  Future<SessionWrapper> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      "/auth/login",
      data: {
        "email": email.trim(),
        "password": password.trim(),
      },
    );
    final results = LoginResponse.fromJson(response.data);
    return results.session;
  }

  Future<String> forgotPassword({
    required String email,
  }) async {
    final response = await _client.post(
      "/auth/forget/password",
      data: {
        "email": email.trim(),
        "redirect_to": "khonic://warehouse/auth/reset-password"
        // "redirect_to": "https://warehouse-dev.khonic.com/app/reset-password"
      },
    );
    return response.data["message"];
  }

  Future<String> resetPassword({
    required String accessToken,
    required String resfreshToken,
    required String newPassword,
  }) async {
    final response = await _client.post(
      "/auth/reset/password",
      options: Options(headers: {
        "access_token": accessToken,
        "refresh_token": resfreshToken,
      }),
      data: {
        "new_password": newPassword.trim(),
        "re_enter_new_password": newPassword.trim(),
      },
    );
    return response.data["message"];
  }

  Future<void> terminateSession() async {
    await _client.delete(
      "/auth/logout",
    );
    return;
  }

  Future<ProfileModel> fetchProfile({
    required String accessToken,
    required String resfreshToken,
  }) async {
    final response = await _client.get(
      "/user/profile",
    );
    return ProfileModel.fromJson(response.data["data"]);
  }
}
