import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/domain/entities/repository.dart';
import '../../domain/usecases/get_repository_usecase_provider.dart';

final fetchRepositoryProvider = FutureProvider.family.autoDispose<Repository, (String owner, String repo)>(
      (ref, tuple) {
    final useCase = ref.watch(getRepositoryUseCaseProvider);
    return useCase.execute(tuple.$1, tuple.$2);
  },
);
