import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../../domain/providers/theme_provider.dart';
import '../../data/models/topic.dart';
import '../../data/roadmap_data.dart';
import '../shared/difficulty_badge.dart';
import '../shared/topic_icon.dart';
import '../shared/toggle_switch.dart';
import '../shared/custom_error_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(allTopicsProvider);
    final recentAsync = ref.watch(recentSnippetsProvider);
    final snippetCountAsync = ref.watch(snippetCountProvider);
    final themeState = ref.watch(themeProvider);
    final theme = Theme.of(context);
    
    // If not overridden, use system brightness. Otherwise respect the manual toggle.
    final bool isDark = themeState.isManualOverride
        ? themeState.mode == ThemeMode.dark
        : MediaQuery.platformBrightnessOf(context) == Brightness.dark;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('DevRef', style: theme.textTheme.headlineLarge),
                      const Spacer(),
                      ToggleSwitch(
                        initiallyDark: isDark,
                        size: 30, // Default is 30, explicit here
                        onChange: (isNowDark) {
                          ref.read(themeProvider.notifier).toggleTheme(isNowDark);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Your code snippet reference',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Search Bar
          SliverToBoxAdapter(
            child: GestureDetector(
              onTap: () => context.go('/search'),
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkCard : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted),
                    const SizedBox(width: 12),
                    Text(
                      'Search snippets...',
                      style: GoogleFonts.inter(
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Topics Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('Topics', style: theme.textTheme.headlineSmall),
                  const Spacer(),
                  TextButton(
                    onPressed: () => context.go('/browse'),
                    child: Text('View All', style: TextStyle(color: isDark ? AppColors.darkAccent : AppColors.lightAccent)),
                  ),
                ],
              ),
            ),
          ),

          // Topics Grid
          topicsAsync.when(
            data: (topics) {
              final displayTopics = topics.length > 6 ? topics.take(6).toList() : topics;
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.1,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _TopicCard(topic: displayTopics[index]),
                    childCount: displayTopics.length,
                    addRepaintBoundaries: true,
                  ),
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: Padding(padding: EdgeInsets.all(40), child: CircularProgressIndicator())),
            ),
            error: (e, _) => SliverToBoxAdapter(child: CustomErrorWidget(message: e.toString())),
          ),

          // Roadmaps Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Row(
                children: [
                  Text('Roadmaps', style: theme.textTheme.headlineSmall),
                  const Spacer(),
                  TextButton(
                    onPressed: () => context.go('/roadmap'),
                    child: Text('View All', style: TextStyle(color: isDark ? AppColors.darkAccent : AppColors.lightAccent)),
                  ),
                ],
              ),
            ),
          ),
          
          // Roadmaps
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final roadmap = roadmaps[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _RoadmapHomeCard(
                      roadmap: roadmap,
                      isDark: isDark,
                      onTap: () => context.push('/roadmap/${roadmap.id}'),
                    ),
                  );
                },
                childCount: roadmaps.length > 2 ? 2 : roadmaps.length,
              ),
            ),
          ),

          // Recently Viewed Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Text('Recently Viewed', style: theme.textTheme.headlineSmall),
            ),
          ),
          recentAsync.when(
            data: (snippets) {
              if (snippets.isEmpty) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                        'No recently viewed snippets',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                        ),
                      ),
                    ),
                  ),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final s = snippets[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      title: Text(s.title, style: theme.textTheme.titleMedium),
                      subtitle: Text(s.language.toUpperCase(), style: theme.textTheme.bodySmall),
                      trailing: DifficultyBadge(difficulty: s.difficulty),
                      onTap: () => context.push('/snippet/${s.snippetId}'),
                    );
                  },
                  childCount: snippets.length,
                  addRepaintBoundaries: true,
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
            error: (_, __) => const SliverToBoxAdapter(child: SizedBox.shrink()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}

class _TopicCard extends StatelessWidget {
  final Topic topic;
  const _TopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final color = AppColors.topicColor(topic.topicId);

    return GestureDetector(
      onTap: () => context.push('/browse/${topic.topicId}'),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: double.infinity,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TopicIcon(topic: topic, size: 32),
                    const SizedBox(height: 8),
                    Text(topic.name, style: theme.textTheme.titleMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text('${topic.snippetCount} snippets', style: theme.textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RoadmapHomeCard extends StatelessWidget {
  final RoadmapCategory roadmap;
  final bool isDark;
  final VoidCallback onTap;

  const _RoadmapHomeCard({
    required this.roadmap,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = isDark ? AppColors.darkCard : AppColors.lightCard;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textMuted = isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;
    final border = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: border.withOpacity(0.5)),
          ),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: roadmap.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(roadmap.emoji, style: const TextStyle(fontSize: 24)),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roadmap.title,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      roadmap.totalDuration,
                      style: GoogleFonts.inter(fontSize: 12, color: textMuted),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
