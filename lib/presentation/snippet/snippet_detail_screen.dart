import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';
import '../../core/theme/app_colors.dart';
import '../../data/datasources/isar_datasource.dart';
import '../../domain/providers/providers.dart';
import '../shared/code_block_widget.dart';
import '../shared/difficulty_badge.dart';

class SnippetDetailScreen extends ConsumerStatefulWidget {
  final String snippetId;
  const SnippetDetailScreen({super.key, required this.snippetId});

  @override
  ConsumerState<SnippetDetailScreen> createState() => _SnippetDetailScreenState();
}

class _SnippetDetailScreenState extends ConsumerState<SnippetDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Update lastViewedAt
    IsarDatasource.updateLastViewed(widget.snippetId).then((_) {
      ref.invalidate(recentSnippetsProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final snippetAsync = ref.watch(snippetByIdProvider(widget.snippetId));
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Snippet'),
        actions: [
          snippetAsync.whenOrNull(
            data: (snippet) {
              if (snippet == null) return const SizedBox.shrink();
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(snippet.isSaved ? Icons.bookmark : Icons.bookmark_border),
                    color: snippet.isSaved
                        ? (isDark ? AppColors.darkAccent : AppColors.lightAccent)
                        : null,
                    onPressed: () async {
                      await IsarDatasource.toggleSave(widget.snippetId);
                      ref.invalidate(snippetByIdProvider(widget.snippetId));
                      ref.invalidate(savedSnippetsProvider);
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(snippet.isSaved ? 'Removed from saved' : 'Saved'),
                            duration: const Duration(seconds: 1),
                          ),
                        );
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      Share.share('${snippet.title}\n\n${snippet.code}');
                    },
                  ),
                ],
              );
            },
          ) ?? const SizedBox.shrink(),
        ],
      ),
      body: snippetAsync.when(
        data: (snippet) {
          if (snippet == null) {
            return const Center(child: Text('Snippet not found'));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(snippet.title, style: theme.textTheme.headlineMedium),
                const SizedBox(height: 12),

                // Badges Row
                Row(
                  children: [
                    DifficultyBadge(difficulty: snippet.difficulty),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => context.push('/browse/${snippet.topicId}'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.topicColor(snippet.topicId).withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.topicColor(snippet.topicId).withValues(alpha: 0.3)),
                        ),
                        child: Text(
                          snippet.language.toUpperCase(),
                          style: TextStyle(
                            color: AppColors.topicColor(snippet.topicId),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Code Block
                CodeBlockWidget(code: snippet.code, language: snippet.language),
                const SizedBox(height: 20),

                // Description
                Text('Description', style: theme.textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  snippet.description,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}
