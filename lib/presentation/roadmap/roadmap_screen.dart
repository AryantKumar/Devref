import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/roadmap_data.dart';

class RoadmapScreen extends StatelessWidget {
  const RoadmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.darkBackground : AppColors.lightBackground;
    final textPrimary = isDark ? AppColors.darkTextPrimary : AppColors.lightTextPrimary;
    final textMuted = isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted;
    final cardColor = isDark ? AppColors.darkCard : AppColors.lightCard;
    final border = isDark ? AppColors.darkBorder : AppColors.lightBorder;

    return Scaffold(
      backgroundColor: bg,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 130,
            floating: false,
            pinned: true,
            backgroundColor: bg,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              title: Text(
                'Roadmaps',
                style: GoogleFonts.inter(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: textPrimary,
                ),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      const Color(0xFF58A6FF).withOpacity(0.08),
                      const Color(0xFFD2A8FF).withOpacity(0.05),
                      bg,
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 100),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final roadmap = roadmaps[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _RoadmapCard(
                      roadmap: roadmap,
                      isDark: isDark,
                      cardColor: cardColor,
                      border: border,
                      textPrimary: textPrimary,
                      textMuted: textMuted,
                      onTap: () => context.push('/roadmap/${roadmap.id}'),
                    ),
                  );
                },
                childCount: roadmaps.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RoadmapCard extends StatelessWidget {
  final RoadmapCategory roadmap;
  final bool isDark;
  final Color cardColor;
  final Color border;
  final Color textPrimary;
  final Color textMuted;
  final VoidCallback onTap;

  const _RoadmapCard({
    required this.roadmap,
    required this.isDark,
    required this.cardColor,
    required this.border,
    required this.textPrimary,
    required this.textMuted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
            boxShadow: [
              BoxShadow(
                color: roadmap.color.withOpacity(0.06),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Emoji Icon
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: roadmap.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    roadmap.emoji,
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roadmap.title,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: textPrimary,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      roadmap.subtitle,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: roadmap.color,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.schedule_rounded, size: 13, color: textMuted),
                        const SizedBox(width: 4),
                        Text(
                          roadmap.totalDuration,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: textMuted,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Icon(Icons.flag_rounded, size: 13, color: textMuted),
                        const SizedBox(width: 4),
                        Text(
                          '${roadmap.steps.length} milestones',
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            color: textMuted,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right_rounded, color: textMuted, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
