import 'package:test_boilerplate/app/router/utils/khonic_route.dart';
import 'package:test_boilerplate/app/router/utils/transition_type.dart';
import 'package:test_boilerplate/features/dashboard/presentation/view/home_page.dart';

part 'route_config.dart';

final routes = KhonicRoute(
  path: _RoutePath.home,
  transitionType: TransitionType.fade,
  builder: (context, state) {
    return const HomePage();
  },
);
