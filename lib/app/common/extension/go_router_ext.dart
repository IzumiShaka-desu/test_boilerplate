import 'package:go_router/go_router.dart';

extension GoRouterLocation on GoRouter {
  String get location {
    try {
      final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
      final RouteMatchList matchList =
          lastMatch is ImperativeRouteMatch ? lastMatch.matches : routerDelegate.currentConfiguration;
      return matchList.uri.toString();
    } catch (e) {
      return '';
    }
  }
}
