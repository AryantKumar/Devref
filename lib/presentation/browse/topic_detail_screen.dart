import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../shared/topic_icon.dart';
import '../shared/custom_error_widget.dart';
import '../../data/models/topic.dart';

class TopicDetailScreen extends ConsumerWidget {
  final String topicId;
  const TopicDetailScreen({super.key, required this.topicId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicAsync = ref.watch(topicByIdProvider(topicId));
    final sectionsAsync = ref.watch(topicSectionsProvider(topicId));
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
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: topic?.name ?? '',
                    style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: ' cheatsheet',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                    ),
                  ),
                ]),
              ),
            ],
          ),
          loading: () => const Text('Loading...'),
          error: (_, __) => const Text('Error'),
        ),
      ),
      body: sectionsAsync.when(
        data: (sections) {
          if (sections.isEmpty) {
            return const Center(child: Text('No sections found'));
          }
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                sliver: SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 24, left: 4),
                    child: Text(
                      'A quick reference cheatsheet that includes usage, examples, and more.',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                      ),
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.1, // Near-square cards
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final section = sections[index];
                      final topic = topicAsync.value;
                      return _SectionCard(
                        sectionName: section,
                        topic: topic,
                        isDark: isDark,
                        onTap: () => context.push(
                          '/browse/$topicId/section',
                          extra: section,
                        ),
                      );
                    },
                    childCount: sections.length,
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => CustomErrorWidget(message: e.toString()),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  final String sectionName;
  final Topic? topic;
  final bool isDark;
  final VoidCallback onTap;

  const _SectionCard({
    required this.sectionName,
    this.topic,
    required this.isDark,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isDark ? AppColors.darkCard : AppColors.lightCard,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: (isDark ? AppColors.darkBorder : AppColors.lightBorder)
                  .withOpacity(0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (topic != null)
                    TopicIcon(topic: topic!, size: 30) // Larger icon for grid
                  else
                    Icon(
                      Icons.layers_rounded,
                      size: 26,
                      color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                    ),
                  Icon(
                    Icons.chevron_right_rounded,
                    size: 20,
                    color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                  ),
                ],
              ),
              Text(
                sectionName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  height: 1.2,
                  fontWeight: FontWeight.w700,
                  color: isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
