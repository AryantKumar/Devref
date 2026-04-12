import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../data/datasources/isar_datasource.dart';
import '../../data/models/snippet.dart';
import '../../domain/providers/providers.dart';
import '../shared/snippet_card.dart';

class SavedScreen extends ConsumerWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedAsync = ref.watch(savedSnippetsProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Saved', style: theme.textTheme.headlineLarge),
                const SizedBox(height: 4),
                Text(
                  'Your bookmarked snippets',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: savedAsync.when(
              data: (snippets) {
                if (snippets.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.bookmark_border, size: 64,
                          color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted),
                        const SizedBox(height: 16),
                        Text('Nothing saved yet', style: theme.textTheme.titleLarge?.copyWith(
                          color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted)),
                        const SizedBox(height: 8),
                        Text(
                          'Tap the bookmark on any snippet to save it',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted),
                        ),
                      ],
                    ),
                  );
                }

                // Flatten grouped data for ListView.builder performance
                final grouped = <String, List<dynamic>>{};
                for (var s in snippets) {
                  grouped.putIfAbsent(s.topicId, () => []).add(s);
                }

                final flatList = <dynamic>[];
                for (final entry in grouped.entries) {
                  flatList.add({'type': 'header', 'topicId': entry.key});
                  flatList.addAll(entry.value.map((s) => {'type': 'snippet', 'data': s}));
                }

                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemCount: flatList.length,
                  itemBuilder: (context, index) {
                    final item = flatList[index];
                    if (item['type'] == 'header') {
                      final topicId = item['topicId'] as String;
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 16, 20, 4),
                        child: Text(
                          topicId.toUpperCase().replaceAll('_', ' '),
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                            color: AppColors.topicColor(topicId),
                          ),
                        ),
                      );
                    } else {
                      final s = item['data'] as Snippet;
                      return SnippetCard(
                        snippet: s,
                        onTap: () => context.push('/snippet/${s.snippetId}'),
                        onBookmark: () async {
                          await IsarDatasource.toggleSave(s.snippetId);
                        },
                      );
                    }
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }
}
