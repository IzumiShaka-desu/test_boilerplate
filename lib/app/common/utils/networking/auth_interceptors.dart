import 'package:dio/dio.dart';
import 'package:test_boilerplate/app/core/data/datasources/local/local_datasources.dart';

class AuthInterceptors extends Interceptor {
  final SessionDatasources sessionDatasources;

  AuthInterceptors({
    required this.sessionDatasources,
  });
  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final session = sessionDatasources.getSession();
    if (session != null) {
      options.headers['access_token'] = session.accessToken;
      options.headers['refresh_token'] = session.refreshToken;
    }

    return super.onRequest(options, handler);
  }
}
