import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../../data/models/snippet.dart';
import '../shared/snippet_card.dart';
import '../shared/topic_icon.dart';
import '../shared/custom_error_widget.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = ref.watch(searchQueryProvider);
    final resultsAsync = ref.watch(searchResultsProvider);
    final topicsAsync = ref.watch(allTopicsProvider);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SafeArea(
      child: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              controller: _controller,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Search snippets...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (query.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear, size: 20),
                        onPressed: () {
                          _controller.clear();
                          ref.read(searchQueryProvider.notifier).setQuery('');
                        },
                      ),
                    IconButton(
                      icon: Icon(Icons.auto_awesome, size: 20,
                        color: isDark ? AppColors.darkAccent : AppColors.lightAccent),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('AI Search coming soon — stay tuned!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).setQuery(value);
              },
            ),
          ),

          // Topic Chips (when no query)
          if (query.isEmpty)
            topicsAsync.when(
              data: (topics) => SizedBox(
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: topics.length,
                  itemBuilder: (context, index) {
                    final t = topics[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ActionChip(
                        avatar: TopicIcon(topic: t, size: 16),
                        label: Text(t.name),
                        onPressed: () => context.push('/browse/${t.topicId}'),
                      ),
                    );
                  },
                ),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),

          // Result count
          if (query.isNotEmpty)
            resultsAsync.when(
              data: (results) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${results.length} results for "$query"',
                    style: theme.textTheme.bodySmall,
                  ),
                ),
              ),
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),

          // Results
          Expanded(
            child: resultsAsync.when(
              data: (snippets) {
                if (snippets.isEmpty && query.isNotEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off, size: 64,
                          color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted),
                        const SizedBox(height: 16),
                        Text('No snippets found for "$query"',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted)),
                      ],
                    ),
                  );
                }

                if (query.isEmpty) {
                  // Group by topic, then flatten for ListView.builder performance
                  final grouped = <String, List<Snippet>>{};
                  for (var s in snippets) {
                    grouped.putIfAbsent(s.topicId, () => []).add(s);
                  }

                  final flatList = <dynamic>[];
                  for (final entry in grouped.entries) {
                    flatList.add({'type': 'header', 'topicId': entry.key});
                    flatList.addAll(entry.value.take(5).map((s) => {'type': 'snippet', 'data': s}));
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
                        );
                      }
                    },
                  );
                }

                // Flat search results
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 100),
                  itemCount: snippets.length,
                  itemBuilder: (context, index) {
                    final s = snippets[index];
                    return SnippetCard(
                      snippet: s,
                      onTap: () => context.push('/snippet/${s.snippetId}'),
                      showTopicName: true,
                      topicName: s.topicId.toUpperCase(),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => CustomErrorWidget(message: e.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
