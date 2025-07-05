import 'package:interns2025b_analyzer/src/core/exceptions/http_exception.dart';
import 'package:interns2025b_analyzer/src/core/exceptions/message_exception.dart';
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
    } on HttpException catch (_) {
      rethrow;
    } on Exception
    catch (_) {
      throw MessageException("Something went wrong while fetching repository data. Try again later.");
    }
  }
}
