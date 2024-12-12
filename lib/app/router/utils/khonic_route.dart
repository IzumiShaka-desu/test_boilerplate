import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'transition_type.dart';

class KhonicRoute extends GoRoute {
  final List<SingleChildWidget> providers;
  final TransitionType transitionType;
  KhonicRoute({
    super.parentNavigatorKey,
    super.name,
    required super.path,
    super.onExit,
    super.redirect,
    List<GoRoute> super.routes = const [],
    required Widget Function(BuildContext context, GoRouterState state) builder,
    this.providers = const [],
    this.transitionType = TransitionType.fade, // Default transition
  }) : super(
          pageBuilder: (context, state) {
            // Wrap the widget with providers if any are specified
            final child = builder(context, state);
            final wrappedChild = providers.isNotEmpty
                ? MultiProvider(
                    providers: providers,
                    builder: (context, _) => child,
                  )
                : child;

            // Set up custom transitions based on transitionType
            return CustomTransitionPage(
              child: wrappedChild,
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                switch (transitionType) {
                  case TransitionType.fade:
                    return FadeTransition(opacity: animation, child: child);
                  case TransitionType.slide:
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    );
                  case TransitionType.scale:
                    return ScaleTransition(scale: animation, child: child);
                  default:
                    return child;
                }
              },
            );
          },
        );
}
