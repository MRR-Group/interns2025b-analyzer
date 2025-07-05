import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/domain/usecases/get_repository_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/repository_repository_provider.dart';

part 'get_repository_usecase_provider.g.dart';

@riverpod
GetRepositoryUseCase getRepositoryUseCase(Ref ref) {
  final repository = ref.watch(repositoryRepositoryProvider);
  return GetRepositoryUseCase(repository);
}
