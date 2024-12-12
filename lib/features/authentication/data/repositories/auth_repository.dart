import 'package:flutter/foundation.dart';
import 'package:test_boilerplate/app/common/utils/exception.dart';
import 'package:test_boilerplate/app/common/utils/type_definition.dart';
import 'package:test_boilerplate/features/authentication/domain/entities/user_profile.dart';
import 'package:test_boilerplate/features/authentication/domain/entities/user_session.dart';

import '../../domain/repositories/authentication_repository.dart';
import '../../../../app/core/data/datasources/local/local_datasources.dart';
import '../datasources/remote_auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDatasource remoteDatasource;
  final SessionDatasources sessionDatasources;

  AuthRepositoryImpl({
    required this.remoteDatasource,
    required this.sessionDatasources,
  }) {
    final initialSession = sessionDatasources.getSession();

    _userSession = ValueNotifier(
      initialSession == null
          ? null
          : UserSession(
              accessToken: initialSession.accessToken,
              refreshToken: initialSession.refreshToken,
              expiresIn: initialSession.expiresIn,
              expiresAt: initialSession.expiresAt,
              tokenType: initialSession.tokenType,
            ),
    );
    sessionDatasources.listenableSession.addListener(
      () {
        final session = sessionDatasources.getSession();

        _userSession.value = session == null
            ? null
            : UserSession(
                accessToken: session.accessToken,
                refreshToken: session.refreshToken,
                expiresIn: session.expiresIn,
                expiresAt: session.expiresAt,
                tokenType: session.tokenType,
              );
      },
    );
  }

  late final ValueNotifier<UserSession?> _userSession;

  @override
  ValueNotifier<UserSession?> get listenableSession => _userSession;

  @override
  Future<FailOr<String>> login({
    required String email,
    required String password,
  }) async =>
      await tryCatch(() async {
        final results = await remoteDatasource.login(
          email: email,
          password: password,
        );
        await sessionDatasources.saveSession(results.session);
        return results.message;
      });
  @override
  void logout() async {
    final session = listenableSession.value;
    if (session != null) {
      try {
        await remoteDatasource.terminateSession();
      } catch (e) {
        debugPrint(e.toString());
      }

      await sessionDatasources.deleteSession();
    }
  }

  @override
  Future<FailOr<String>> forgotPassword({
    required String email,
  }) async =>
      await tryCatch(() async {
        final results = await remoteDatasource.forgotPassword(
          email: email,
        );
        return results;
      });

  @override
  Future<FailOr<String>> resetPassword({
    required String accessToken,
    required String resfreshToken,
    required String newPassword,
  }) async =>
      tryCatch(
        () async {
          final results = await remoteDatasource.resetPassword(
            accessToken: accessToken,
            resfreshToken: resfreshToken,
            newPassword: newPassword,
          );
          return results;
        },
      );

  @override
  Future<FailOr<UserProfile>> fetchProfile() async => tryCatch(
        () async {
          final session = listenableSession.value;
          if (session != null) {
            final result = await remoteDatasource.fetchProfile(
              accessToken: session.accessToken,
              resfreshToken: session.refreshToken,
            );
            return result.toEntity();
          }
          throw UnAuthorizedException(
            "you are not authorized to access this resources",
          );
        },
      );
}
