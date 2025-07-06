import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:interns2025b_analyzer/config/theme.dart';
import 'package:interns2025b_analyzer/src/core/routes/router_provider.dart';

void main() {
  usePathUrlStrategy();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget  {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: theme,
      title: 'Interns2025b Analyzer',
    );
  }
}
