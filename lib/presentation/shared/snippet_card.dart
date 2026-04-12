import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/snippet.dart';
import 'difficulty_badge.dart';

class SnippetCard extends StatelessWidget {
  final Snippet snippet;
  final VoidCallback onTap;
  final VoidCallback? onBookmark;
  final bool showTopicName;
  final String? topicName;

  const SnippetCard({
    super.key,
    required this.snippet,
    required this.onTap,
    this.onBookmark,
    this.showTopicName = false,
    this.topicName,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snippet.title,
                        style: theme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (showTopicName && topicName != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          topicName!,
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                DifficultyBadge(difficulty: snippet.difficulty),
                if (onBookmark != null) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onBookmark,
                    child: Icon(
                      snippet.isSaved ? Icons.bookmark : Icons.bookmark_border,
                      color: snippet.isSaved
                          ? (isDark ? AppColors.darkAccent : AppColors.lightAccent)
                          : (isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted),
                      size: 22,
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.codeBackground,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                _previewCode(snippet.code),
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  color: AppColors.codeText,
                  height: 1.4,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _previewCode(String code) {
    final lines = code.split('\n');
    return lines.take(3).join('\n');
  }
}
