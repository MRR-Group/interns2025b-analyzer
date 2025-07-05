import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'network_service.dart';

part 'network_service_provider.g.dart';

@riverpod
Dio dio(Ref ref) {
  return Dio();
}

@riverpod
NetworkService networkService(Ref ref) {
  final dioClient = ref.watch(dioProvider);
  return NetworkService(dio: dioClient, baseUrl: 'https://api.github.com');
}
