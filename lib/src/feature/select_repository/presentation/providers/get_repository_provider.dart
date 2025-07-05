import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/domain/entities/repository.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/domain/usecases/get_repository_usecase_provider.dart';

final getRepositoryProvider = FutureProvider.family.autoDispose<Repository, (String owner, String repo)>(
      (ref, args) {
    final useCase = ref.watch(getRepositoryUseCaseProvider);
    return useCase.execute(args.$1, args.$2);
  },
);
