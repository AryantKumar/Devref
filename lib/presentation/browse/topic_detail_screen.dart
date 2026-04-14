import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../shared/topic_icon.dart';
import '../shared/custom_error_widget.dart';
import '../shared/glass_card.dart';
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
      backgroundColor: AppColors.darkBackground,
      body: topicAsync.when(
        data: (topic) {
          if (topic == null) return const CustomErrorWidget(message: 'Topic data unavailable');
          final color = AppColors.topicColor(topic.topicId);
          
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── Futuristic SliverAppBar ──
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: BackButton(color: Colors.white.withOpacity(0.8)),
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      // Gradient Background
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              color.withOpacity(0.2),
                              AppColors.darkBackground,
                            ],
                          ),
                        ),
                      ),
                      // Abstract Pattern/Circle
                      Positioned(
                        top: -50,
                        right: -50,
                        child: Container(
                          width: 250,
                          height: 250,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: color.withOpacity(0.05),
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                            child: Container(color: Colors.transparent),
                          ),
                        ),
                      ),
                      // Topic Info Header
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: color.withOpacity(0.15),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: color.withOpacity(0.3)),
                                  ),
                                  child: TopicIcon(topic: topic, size: 42),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'INTELLIGENCE_LAYER',
                                        style: GoogleFonts.jetBrainsMono(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w700,
                                          color: color,
                                          letterSpacing: 2,
                                        ),
                                      ),
                                      Text(
                                        topic.name,
                                        style: GoogleFonts.spaceGrotesk(
                                          fontSize: 32,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Summary Description ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This module provides critical syntax patterns, architectural boilerplate, and professional-grade implementation strategies for ${topic.name}.',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          height: 1.6,
                          color: AppColors.darkTextMuted,
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'CORE MODULES',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: AppColors.neuralPrimary.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Section Grid ──
              sectionsAsync.when(
                data: (sections) => SliverPadding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 100),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 1.1,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final section = sections[index];
                        return _SectionCard(
                          sectionName: section,
                          topic: topic,
                          color: color,
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
                loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
                error: (e, _) => SliverToBoxAdapter(child: CustomErrorWidget(message: e.toString())),
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
  final Topic topic;
  final Color color;
  final VoidCallback onTap;

  const _SectionCard({
    required this.sectionName,
    required this.topic,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        color: AppColors.neuralSurfaceContainerHigh.withOpacity(0.4),
        borderRadius: 16,
        accentColor: color,
        accentWidth: 1.5,
        borderColor: Colors.white.withOpacity(0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.code_rounded, size: 16, color: color),
                ),
                Icon(Icons.arrow_forward_rounded, size: 14, color: Colors.white24),
              ],
            ),
            Text(
              sectionName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white.withOpacity(0.9),
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
