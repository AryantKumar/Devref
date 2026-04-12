import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../data/datasources/isar_datasource.dart';
import '../../domain/providers/providers.dart';
import '../shared/snippet_card.dart';
import '../shared/topic_icon.dart';

class TopicDetailScreen extends ConsumerStatefulWidget {
  final String topicId;
  const TopicDetailScreen({super.key, required this.topicId});

  @override
  ConsumerState<TopicDetailScreen> createState() => _TopicDetailScreenState();
}

class _TopicDetailScreenState extends ConsumerState<TopicDetailScreen> {
  String _selectedDifficulty = 'all';

  @override
  Widget build(BuildContext context) {
    final topicAsync = ref.watch(topicByIdProvider(widget.topicId));
    final snippetsAsync = ref.watch(filteredSnippetsProvider(
      (topicId: widget.topicId, difficulty: _selectedDifficulty),
    ));
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: topicAsync.when(
          data: (topic) => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (topic != null) TopicIcon(topic: topic, size: 24),
              if (topic != null) const SizedBox(width: 12),
              Text(topic?.name ?? ''),
            ],
          ),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
      ),
      body: Column(
        children: [
          // Filter Chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                _buildChip('All', 'all', isDark),
                _buildChip('Very Easy', 'very_easy', isDark),
                _buildChip('Medium', 'medium', isDark),
                _buildChip('Hard', 'hard', isDark),
                _buildChip('Very Hard', 'very_hard', isDark),
              ],
            ),
          ),
          // Snippet List
          Expanded(
            child: snippetsAsync.when(
              data: (snippets) => ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: snippets.length,
                itemBuilder: (context, index) {
                  final s = snippets[index];
                  return SnippetCard(
                    snippet: s,
                    onTap: () => context.push('/snippet/${s.snippetId}'),
                    onBookmark: () async {
                      await IsarDatasource.toggleSave(s.snippetId);
                      ref.invalidate(filteredSnippetsProvider);
                    },
                  );
                },
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, String value, bool isDark) {
    final isSelected = _selectedDifficulty == value;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (_) => setState(() => _selectedDifficulty = value),
        selectedColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
        labelStyle: TextStyle(
          color: isSelected
              ? Colors.white
              : (isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary),
          fontSize: 13,
        ),
        checkmarkColor: Colors.white,
      ),
    );
  }
}
