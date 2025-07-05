import 'package:interns2025b_analyzer/src/feature/select_repository/domain/entities/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/usecases/get_repository_usecase_provider.dart';

part 'repository_controller.g.dart';

@riverpod
class RepositoryController extends _$RepositoryController {
  @override
  FutureOr<Repository?> build() {
    // Zwracamy null, aby stan początkowy nie był traktowany jako błąd.
    // Logika pobierania danych jest obsługiwana przez metodę fetch.
    return null;
  }

  Future<void> fetch(String owner, String repo) async {
    state = const AsyncLoading();
    final useCase = ref.watch(getRepositoryUseCaseProvider);
    state = await AsyncValue.guard(() => useCase.execute(owner, repo));
  }
}