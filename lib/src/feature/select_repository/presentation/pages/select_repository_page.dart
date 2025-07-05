import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/presentation/providers/get_repository_provider.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/presentation/widgets/repository_card_widget.dart';

class SelectRepositoryPage extends ConsumerWidget {
  const SelectRepositoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repositoryAsync = ref.watch(
      fetchRepositoryProvider(("blumilksoftware", "interns2025b-mobile")),
    );

    return Center(
      child: repositoryAsync.when(
        data: (repository) => RepositoryCard(
          repositoryName: repository.name,
          repositoryDescription: repository.description,
          imageUrl: repository.ownerAvatarUrl,
          ownerName: repository.ownerName,
          stargazersCount: repository.stargazersCount,
          watchersCount: repository.watchersCount,
          forksCount: repository.forksCount,
          openIssuesCount: repository.openIssuesCount,
        ),
        error: (e, _) => Text(e.toString()),
        loading: () => CircularProgressIndicator(),
      ),
    );
  }
}
