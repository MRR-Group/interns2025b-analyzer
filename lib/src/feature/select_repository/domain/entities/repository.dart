class Repository {
  final String name;
  final String description;
  final String ownerName;
  final String ownerAvatarUrl;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;
  final int openIssuesCount;

  Repository({
    required this.name,
    required this.description,
    required this.ownerName,
    required this.ownerAvatarUrl,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
    required this.openIssuesCount,
  });
}