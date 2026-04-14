import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../../data/models/topic.dart';
import '../shared/topic_icon.dart';
import '../shared/glass_card.dart';
import '../shared/mastery_progress_bar.dart';

class BrowseScreen extends ConsumerWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(allTopicsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF0F1014),
      body: SafeArea(
        child: topicsAsync.when(
          data: (topics) {
            final webTopics = topics.where((t) => ['javascript', 'typescript', 'react', 'html', 'css', 'vue', 'angular'].contains(t.topicId)).toList();
            final backendTopics = topics.where((t) => ['go', 'python', 'java', 'ruby', 'php', 'c', 'cpp', 'csharp', 'rust', 'nodejs'].contains(t.topicId)).toList();
            final mobileTopics = topics.where((t) => ['dart', 'kotlin', 'swift', 'flutter', 'react_native'].contains(t.topicId)).toList();
            final otherTopics = topics.where((t) => !webTopics.contains(t) && !backendTopics.contains(t) && !mobileTopics.contains(t)).toList();

            return CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // ── Modern Header ──
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 48, 24, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore Intelligence',
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'CURATED MODULES FOR MODERN ARCHITECTS',
                          style: GoogleFonts.jetBrainsMono(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: Colors.cyan.withOpacity(0.8),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Web Ecosystem Section ──
                if (webTopics.isNotEmpty) ...[
                  _buildSectionHeader('WEB ECOSYSTEM', '${webTopics.length} MODULES'),
                  _buildGrid(webTopics),
                ],

                // ── Infrastructure & Backend Section ──
                if (backendTopics.isNotEmpty) ...[
                  _buildSectionHeader('INFRASTRUCTURE & BACKEND', '${backendTopics.length} MODULES'),
                  _buildGrid(backendTopics),
                ],

                // ── Mobile Development Section ──
                if (mobileTopics.isNotEmpty) ...[
                  _buildSectionHeader('MOBILE DEVELOPMENT', '${mobileTopics.length} MODULES'),
                  _buildGrid(mobileTopics),
                ],

                // ── Data & Utilities Section ──
                if (otherTopics.isNotEmpty) ...[
                  _buildSectionHeader('DATA & UTILITIES', '${otherTopics.length} MODULES'),
                  _buildGrid(otherTopics),
                ],

                const SliverToBoxAdapter(child: SizedBox(height: 120)),
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e')),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String badge) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white54,
                letterSpacing: 1.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.white.withOpacity(0.05)),
              ),
              child: Text(
                badge,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(List<Topic> sectionTopics) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1.1,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _GridTopicCard(topic: sectionTopics[index]),
          childCount: sectionTopics.length,
        ),
      ),
    );
  }
}

class _GridTopicCard extends StatelessWidget {
  final Topic topic;
  const _GridTopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.topicColor(topic.topicId);
    
    // Mock progress based on topic for UI fidelity
    double progress = 0.40;
    if (topic.topicId == 'typescript') progress = 0.92;
    if (topic.topicId == 'javascript') progress = 0.74;
    if (topic.topicId == 'python') progress = 0.65;
    if (topic.topicId == 'go') progress = 0.42;

    return GestureDetector(
      onTap: () => context.push('/browse/${topic.topicId}'),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF141518),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withOpacity(0.03)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TopicIcon(topic: topic, size: 28),
            const SizedBox(height: 16),
            Text(
              topic.name,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            MasteryProgressBar(
              progress: progress,
              color: color,
              label: 'MASTERY',
            ),
          ],
        ),
      ),
    );
  }
}

