import '../../domain/entities/repository.dart';

class RepositoryModel {
  final String name;
  final String description;
  final String ownerName;
  final String ownerAvatarUrl;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;
  final int openIssuesCount;

  RepositoryModel({
    required this.name,
    required this.description,
    required this.ownerName,
    required this.ownerAvatarUrl,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
    required this.openIssuesCount,
  });

  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      name: json['name'],
      description: json['description'] ?? 'No description, website, or topics provided.',
      ownerName: json['owner']['login'],
      ownerAvatarUrl: json['owner']['avatar_url'],
      stargazersCount: json['stargazers_count'],
      watchersCount: json['subscribers_count'],
      forksCount: json['forks_count'],
      openIssuesCount: json['open_issues_count'],
    );
  }

  Repository toEntity() => Repository(
    name: name,
    description: description,
    ownerName: ownerName,
    ownerAvatarUrl: ownerAvatarUrl,
    stargazersCount: stargazersCount,
    watchersCount: watchersCount,
    forksCount: forksCount,
    openIssuesCount: openIssuesCount,
  );
}