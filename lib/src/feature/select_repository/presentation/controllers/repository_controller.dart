import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/repositories/repository_repository_provider.dart';
import '../../domain/usecases/get_repository_usecase.dart';

part 'repository_controller.g.dart';

@riverpod
class RepositoryController extends _$RepositoryController {
  late final GetRepositoryUseCase _useCase;

  @override
  FutureOr<void> build() {
    _useCase = GetRepositoryUseCase(ref.watch(repositoryRepositoryProvider));
    return null;
  }

  Future<void> fetch(String owner, String repo) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _useCase.execute(owner, repo));
  }
}