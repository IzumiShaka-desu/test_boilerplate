part of 'router.dart';

abstract class _RoutePath {
  // auth
  static const auth = '/auth';
  static const login = 'login';
  static const forgotPassword = 'forgot-password';
  static const resetPassword = 'reset-password';
  // profile
  static const profile = '/profile';
}

abstract class RouteConfig {
  static const auth = '/auth';
  static const login = '/auth/login';
  static const forgotPassword = '/auth/forgot-password';
  static const resetPassword = '/auth/reset-password';
  static const profile = '/profile';
}
