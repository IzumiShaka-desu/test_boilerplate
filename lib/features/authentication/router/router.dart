import 'package:test_boilerplate/app/core/ui_components/templates/not_found_page.dart';
import 'package:test_boilerplate/app/router/utils/khonic_route.dart';
import 'package:test_boilerplate/app/router/utils/transition_type.dart';

import '../presentation/view/forgot_password/forgot_password_page.dart';
import '../presentation/view/login_page.dart';
import '../presentation/view/profile_page.dart';
import '../presentation/view/reset_password/reset_password_page.dart';
part 'route_config.dart';

final routes = KhonicRoute(
  path: _RoutePath.auth,
  builder: (context, state) {
    return const NotFoundPage();
  },
  routes: [
    KhonicRoute(
      path: _RoutePath.forgotPassword,
      transitionType: TransitionType.slide,
      builder: (context, state) => const ForgotPasswordPage(),
    ),
    KhonicRoute(
      path: _RoutePath.resetPassword,
      transitionType: TransitionType.slide,
      builder: (context, state) {
        final url = Uri.dataFromString(state.uri.toString().replaceFirst("#", "?"));
        final accessToken = url.queryParameters["access_token"];
        final refreshToken = url.queryParameters["refresh_token"];
        return accessToken == null || refreshToken == null
            ? const NotFoundPage()
            : ResetPasswordPage(
                accessToken: accessToken,
                refreshToken: refreshToken,
              );
      },
    ),
    KhonicRoute(
      path: _RoutePath.login,
      transitionType: TransitionType.slide,
      builder: (context, state) => const LoginPage(),
    ),
  ],
);

final profileRoutes = KhonicRoute(
  path: _RoutePath.profile,
  transitionType: TransitionType.fade,
  builder: (context, state) => const ProfilePage(),
);
