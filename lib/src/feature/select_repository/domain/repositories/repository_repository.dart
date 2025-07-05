import 'package:interns2025b_analyzer/src/feature/select_repository/domain/entities/repository.dart';

abstract class RepositoryRepository {
  Future<Repository> fetchRepository(String ownerName, String repositoryName);
}