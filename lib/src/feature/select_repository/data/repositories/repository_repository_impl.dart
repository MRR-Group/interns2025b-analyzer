import '../../domain/entities/repository.dart';
import '../../domain/repositories/repository_repository.dart';
import '../data_source/repository_remote_datasource.dart';


class RepositoryRepositoryImpl implements RepositoryRepository {
  final RepositoryRemoteDataSource remoteDataSource;

  RepositoryRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Repository> fetchRepository(String ownerName, String repositoryName) async {
      final repository = await remoteDataSource.fetchRepository(ownerName, repositoryName);

      return repository.toEntity();
  }
}