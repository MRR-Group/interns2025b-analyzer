import 'package:flutter/material.dart';

import '../../../../../config/colors.dart';

class RepositoryCard extends StatelessWidget {
  final String imageUrl;
  final String ownerName;
  final String repositoryName;
  final String repositoryDescription;
  final int stargazersCount;
  final int watchersCount;
  final int forksCount;
  final int openIssuesCount;

  const RepositoryCard({
    super.key,
    required this.repositoryName,
    required this.repositoryDescription,
    required this.imageUrl,
    required this.ownerName,
    required this.stargazersCount,
    required this.watchersCount,
    required this.forksCount,
    required this.openIssuesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipOval(
                      child: Semantics(
                        label: 'Avatar of $ownerName',
                        child: Image.network(imageUrl, width: 20, height: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          ownerName,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    repositoryName,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    repositoryDescription,
                    maxLines: 5,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 8,
                      children: [
                        _buildStatItem(Icons.star, stargazersCount.toString()),
                        _buildStatItem(
                          Icons.remove_red_eye_rounded,
                          watchersCount.toString(),
                        ),
                        _buildStatItem(Icons.fork_right, forksCount.toString()),
                        _buildStatItem(
                          Icons.warning_amber_rounded,
                          openIssuesCount.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: secondaryTextColor, size: 16),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(label, softWrap: true, overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
