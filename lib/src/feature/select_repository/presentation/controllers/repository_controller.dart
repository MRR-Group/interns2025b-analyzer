import 'package:interns2025b_analyzer/src/core/exceptions/http_exception.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/domain/entities/repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/usecases/get_repository_usecase_provider.dart';

part 'repository_controller.g.dart';

@riverpod
class RepositoryController extends _$RepositoryController {
  @override
  FutureOr<Repository?> build() {
    return null;
  }

  Future<void> fetch(String owner, String repo) async {
    state = const AsyncLoading();
    try {
      final useCase = ref.watch(getRepositoryUseCaseProvider);
      final repository = await useCase.execute(owner, repo);

      state = AsyncData(repository);
    } on HttpException catch (e) {
      if (e.statusCode == 404) {
        state = AsyncError(
          'Repository not found. Please check the owner and repository name.',
          StackTrace.current,
        );
      } else {
        state = AsyncError(
          'An unexpected network error occurred. Please try again later.',
          StackTrace.current,
        );
      }
    } catch (e) {
      state = AsyncError(
        'An unknown error occurred.',
        StackTrace.current,
      );
    }
  }
}