import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/repositories/repository_repository.dart';
import '../data_source/repository_remote_datasource_provider.dart';
import 'repository_repository_impl.dart';

part 'repository_repository_provider.g.dart';

@riverpod
RepositoryRepository repositoryRepository(Ref ref) {
  final remote = ref.watch(repositoryRemoteDataSourceProvider);
  return RepositoryRepositoryImpl(remoteDataSource: remote);
}
