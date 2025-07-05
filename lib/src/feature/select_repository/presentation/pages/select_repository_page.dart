import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/presentation/controllers/repository_controller.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/presentation/widgets/repository_card_widget.dart';

class SelectRepositoryPage extends ConsumerStatefulWidget {
  final String? ownerName;
  final String? repositoryName;

  const SelectRepositoryPage({super.key, this.ownerName, this.repositoryName});

  @override
  ConsumerState<SelectRepositoryPage> createState() =>
      _SelectRepositoryPageState();
}

class _SelectRepositoryPageState extends ConsumerState<SelectRepositoryPage> {
  @override
  void initState() {
    super.initState();
    final ownerName = widget.ownerName ?? "blumilksoftware";
    final repositoryName = widget.repositoryName ?? "interns2025b-mobile";

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(repositoryControllerProvider.notifier)
          .fetch(ownerName, repositoryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    final repositoryAsync = ref.watch(repositoryControllerProvider);

    return Center(
      child: repositoryAsync.when(
        data: (repository) {
          if (repository == null) {
            return const CircularProgressIndicator();
          }
          return RepositoryCard(
            repositoryName: repository.name,
            repositoryDescription: repository.description,
            imageUrl: repository.ownerAvatarUrl,
            ownerName: repository.ownerName,
            stargazersCount: repository.stargazersCount,
            watchersCount: repository.watchersCount,
            forksCount: repository.forksCount,
            openIssuesCount: repository.openIssuesCount,
          );
        },
        error: (e, _) => Text(e.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
