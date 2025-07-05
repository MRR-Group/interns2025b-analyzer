import 'package:flutter/material.dart';
import 'package:interns2025b_analyzer/src/feature/select_repository/presentation/widgets/repository_card_widget.dart';

class SelectRepositoryPage extends StatelessWidget {
  const SelectRepositoryPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: RepositoryCard(
          repositoryName: "interns2025b-mobile",
          repositoryDescription: "No description available",
          imageUrl: "https://images.icon-icons.com/3685/PNG/512/github_logo_icon_229278.png",
          ownerName: "blumilksoftware",
          stargazersCount: 0,
          watchersCount: 0,
          forksCount: 0,
          openIssuesCount: 0,
        ),
    );
  }
}
