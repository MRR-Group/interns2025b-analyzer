import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interns2025b_analyzer/config/theme.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/presentation/pages/select_repository_page.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Interns2025b Analyzer',
      theme: theme,
      home: Scaffold(
        appBar: AppBar(title: Text('Select Repository')),
        body: SelectRepositoryPage(),
      ),
    );
  }
}
