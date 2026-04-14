import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../../data/models/topic.dart';
import '../shared/topic_icon.dart';
import '../shared/glass_card.dart';

class QuizScreen extends ConsumerWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(allTopicsProvider);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      appBar: _buildSyntheticHeader(context, ref),
      body: topicsAsync.when(
        data: (topics) => ListView.builder(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 120),
          itemCount: topics.length,
          itemBuilder: (context, index) => _DiagnosticQuizCard(topic: topics[index]),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e', style: const TextStyle(color: Colors.white70))),
      ),
    );
  }

  PreferredSizeWidget _buildSyntheticHeader(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 160,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Synthetic Top Bar
              Row(
                children: [
                  const Icon(Icons.terminal_rounded, size: 16, color: AppColors.neonGlowCyan),
                  const SizedBox(width: 8),
                  Text(
                    'DEVREF_QUIZ',
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.white.withOpacity(0.9),
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text(
                'Quiz Catalogue',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Challenge your knowledge. Begin below.',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white24,
                  letterSpacing: 1.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DiagnosticQuizCard extends StatelessWidget {
  final Topic topic;
  const _DiagnosticQuizCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    final color = AppColors.topicColor(topic.topicId);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => context.push('/quiz/${topic.topicId}/play'),
        child: GlassCard(
          padding: EdgeInsets.zero,
          color: AppColors.neuralSurfaceContainerHigh.withOpacity(0.4),
          borderRadius: 12,
          borderColor: Colors.white.withOpacity(0.05),
          child: IntrinsicHeight(
            child: Row(
              children: [
                // Left Accent Bar
                Container(
                  width: 4,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Icon
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TopicIcon(topic: topic, size: 24),
                  ),
                ),
                const SizedBox(width: 16),
                // Text info
                Expanded(
                  child: Text(
                    topic.name,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right_rounded,
                  color: Colors.white.withOpacity(0.1),
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

