import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_boilerplate/app/core/ui_components/templates/default_scaffold.dart';
import 'package:test_boilerplate/features/dashboard/presentation/viewmodel/home_viewmodel.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final message = context.watch<HomeViewmodel>().message;
    return DefaultScaffold(
      headerConfig: HeaderConfig.mainPage(
        headerContent: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Hello World",
            ),
            Text(
              "Welcome to the app",
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
