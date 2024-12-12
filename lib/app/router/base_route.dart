// core/router/khonic_route.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class KhonicProvider<T extends ChangeNotifier> extends ChangeNotifierProvider<T> {
  final Create<T> create;

  KhonicProvider({super.key, required this.create}) : super(create: create);
  @override
  Widget build(BuildContext context) {
    final existingProvider = context.read<T?>();
    if (existingProvider != null) {
      return ChangeNotifierProvider(
        create: (_) => existingProvider,
      );
    }
    return ChangeNotifierProvider<T>(
      create: create,
    );
  }
}
