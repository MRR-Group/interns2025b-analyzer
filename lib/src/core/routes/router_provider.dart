import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interns2025b_analyzer/src/core/routes/route_names.dart';

import '../../feature/select_repository/presentation/pages/select_repository_page.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return Scaffold(
            appBar: AppBar(title: const Text('Interns2025b Analyzer')),
            body: child,
          );
        },
        routes: [
          GoRoute(
            path: homeRoute,
            builder: (context, state) => SelectRepositoryPage(),
          ),
          GoRoute(
            path: selectRepositoryRoute,
            builder: (context, state) {
              final owner = state.pathParameters['owner']!;
              final repository = state.pathParameters['name']!;
              return SelectRepositoryPage(
                ownerName: owner,
                repositoryName: repository,
              );
            },
          ),
        ],
      ),
    ],
  );
});
