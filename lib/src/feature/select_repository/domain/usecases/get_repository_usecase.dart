import 'package:interns2025b_analyzer/src/feature/select_repository/domain/entities/repository.dart';

import '../repositories/repository_repository.dart';

class GetRepositoryUseCase {
  final RepositoryRepository repository;

  GetRepositoryUseCase(this.repository);

  Future<Repository> execute(String ownerName, String repositoryName) {
    return repository.fetchRepository(ownerName, repositoryName);
  }
}
