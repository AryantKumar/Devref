import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../../data/models/topic.dart';
import '../shared/topic_icon.dart';
import '../shared/skeleton_topic_card.dart';
import '../shared/custom_error_widget.dart';
import '../shared/glass_card.dart';
import '../shared/mastery_progress_bar.dart';

class BrowseScreen extends ConsumerWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(allTopicsProvider);
    final theme = Theme.of(context);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    'Explore Intelligence',
                    style: theme.textTheme.headlineLarge?.copyWith(fontSize: 28),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'CURATED MODULES FOR MODERN ARCHITECTS',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.neonGlowCyan.withOpacity(0.7),
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
          topicsAsync.when(
            data: (topics) {
              // Grouping logic (Hardcoded for design match)
              final webTopics = topics.where((t) => ['javascript', 'typescript', 'html', 'css'].contains(t.topicId.toLowerCase())).toList();
              final backendTopics = topics.where((t) => ['python', 'sql', 'go', 'linux', 'cpp', 'java'].contains(t.topicId.toLowerCase())).toList();
              final mobileTopics = topics.where((t) => ['swift', 'dart', 'kotlin', 'flutter'].contains(t.topicId.toLowerCase())).toList();
              
              return SliverList(
                delegate: SliverChildListDelegate([
                  if (webTopics.isNotEmpty) ...[
                    _buildSectionHeader(context, 'WEB ECOSYSTEM', webTopics.length),
                    _buildTopicGrid(webTopics),
                  ],
                  if (backendTopics.isNotEmpty) ...[
                    _buildSectionHeader(context, 'INFRASTRUCTURE & BACKEND', backendTopics.length),
                    _buildTopicGrid(backendTopics),
                  ],
                  if (mobileTopics.isNotEmpty) ...[
                    _buildSectionHeader(context, 'MOBILE DEVELOPMENT', mobileTopics.length),
                    _buildTopicGrid(mobileTopics),
                  ],
                  const SizedBox(height: 100),
                ]),
              );
            },
            loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            error: (e, _) => SliverToBoxAdapter(child: CustomErrorWidget(message: e.toString())),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, int count) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Colors.white.withOpacity(0.4),
              letterSpacing: 1.0,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Text(
              '$count MODULES',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                fontWeight: FontWeight.w700,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicGrid(List<Topic> topics) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        itemCount: topics.length,
        itemBuilder: (context, index) => _BrowseTopicCard(topic: topics[index]),
      ),
    );
  }
}

class _BrowseTopicCard extends StatelessWidget {
  final Topic topic;
  const _BrowseTopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.topicColor(topic.topicId);

    // Mock progress for design match
    double progress = 0.0;
    if (topic.topicId == 'typescript') progress = 0.92;
    if (topic.topicId == 'javascript') progress = 0.74;
    if (topic.topicId == 'html') progress = 0.98;
    if (topic.topicId == 'css') progress = 0.81;
    if (topic.topicId == 'python') progress = 0.65;
    if (topic.topicId == 'go') progress = 0.42;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push('/browse/${topic.topicId}'),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        color: AppColors.neuralSurfaceContainerHigh.withOpacity(0.4),
        borderRadius: 14,
        borderColor: Colors.white.withOpacity(0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopicIcon(topic: topic, size: 28),
            const Spacer(),
            Text(
              topic.name,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            MasteryProgressBar(
              progress: progress > 0 ? progress : (topic.snippetCount / 100).clamp(0.1, 0.9),
              color: color,
              label: 'MASTERY',
            ),
          ],
        ),
      ),
    );
  }
}
