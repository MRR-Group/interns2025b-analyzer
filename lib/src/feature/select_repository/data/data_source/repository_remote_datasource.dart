import 'package:interns2025b_analyzer/src/core/network/network_service.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/data/models/repository_model.dart';

abstract class RepositoryRemoteDataSource {
  Future<RepositoryModel> fetchRepository(String ownerName, String repositoryName);
}

class RepositoryRemoteDataSourceImpl implements RepositoryRemoteDataSource {
  final NetworkService networkService;

  RepositoryRemoteDataSourceImpl(this.networkService);

  @override
  Future<RepositoryModel> fetchRepository(String ownerName, String repositoryName) async {

    try{
      final response = await networkService.getRequest(
        urlPath: 'repos/$ownerName/$repositoryName',
      );

      return RepositoryModel.fromJson(response);
    } catch (e) {
      throw Exception('Failed to fetch repository: $e');
    }
  }
}
