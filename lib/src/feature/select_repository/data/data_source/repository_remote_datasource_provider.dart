import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/data/data_source/repository_remote_datasource.dart';

import '../../../../core/network/network_service_provider.dart';

part 'repository_remote_datasource_provider.g.dart';

@riverpod
RepositoryRemoteDataSource repositoryRemoteDataSource(Ref ref) {
  final networkService = ref.watch(networkServiceProvider);
  return RepositoryRemoteDataSourceImpl(networkService);
}