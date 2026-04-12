import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/roadmap_data.dart';

class RoadmapDetailScreen extends StatelessWidget {
  final String roadmapId;
  const RoadmapDetailScreen({super.key, required this.roadmapId});

  @override
  Widget build(BuildContext context) {
    final roadmap = roadmaps.firstWhere((r) => r.id == roadmapId);
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
          // ── Header ──
          SliverAppBar(
            expandedHeight: 220,
            pinned: true,
            backgroundColor: bg,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: bg.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back_rounded, color: textPrimary, size: 20),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      roadmap.color.withOpacity(0.2),
                      roadmap.color.withOpacity(0.05),
                      bg,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Emoji + Title
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                color: roadmap.color.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(roadmap.emoji, style: const TextStyle(fontSize: 32)),
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
                                      fontSize: 24,
                                      fontWeight: FontWeight.w800,
                                      color: textPrimary,
                                    ),
                                  ),
                                  Text(
                                    roadmap.subtitle,
                                    style: GoogleFonts.inter(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: roadmap.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        // Description
                        Text(
                          roadmap.description,
                          style: GoogleFonts.inter(fontSize: 13, color: textMuted, height: 1.4),
                        ),
                        const SizedBox(height: 12),
                        // Stats Row
                        Row(
                          children: [
                            _StatChip(
                              icon: Icons.schedule_rounded,
                              label: roadmap.totalDuration,
                              color: roadmap.color,
                              isDark: isDark,
                            ),
                            const SizedBox(width: 10),
                            _StatChip(
                              icon: Icons.flag_rounded,
                              label: '${roadmap.steps.length} milestones',
                              color: roadmap.color,
                              isDark: isDark,
                            ),
                            const SizedBox(width: 10),
                            _StatChip(
                              icon: Icons.auto_awesome_rounded,
                              label: '${roadmap.steps.fold<int>(0, (sum, s) => sum + s.skills.length)} skills',
                              color: roadmap.color,
                              isDark: isDark,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // ── Timeline ──
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final step = roadmap.steps[index];
                  final isLast = index == roadmap.steps.length - 1;
                  return _TimelineItem(
                    step: step,
                    index: index,
                    isLast: isLast,
                    roadmap: roadmap,
                    isDark: isDark,
                    cardColor: cardColor,
                    border: border,
                    textPrimary: textPrimary,
                    textMuted: textMuted,
                  );
                },
                childCount: roadmap.steps.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isDark;

  const _StatChip({
    required this.icon,
    required this.label,
    required this.color,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w600, color: color),
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatefulWidget {
  final RoadmapStep step;
  final int index;
  final bool isLast;
  final RoadmapCategory roadmap;
  final bool isDark;
  final Color cardColor;
  final Color border;
  final Color textPrimary;
  final Color textMuted;

  const _TimelineItem({
    required this.step,
    required this.index,
    required this.isLast,
    required this.roadmap,
    required this.isDark,
    required this.cardColor,
    required this.border,
    required this.textPrimary,
    required this.textMuted,
  });

  @override
  State<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends State<_TimelineItem> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline bar
          SizedBox(
            width: 40,
            child: Column(
              children: [
                // Dot
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: widget.roadmap.color.withOpacity(0.15),
                    shape: BoxShape.circle,
                    border: Border.all(color: widget.roadmap.color, width: 2),
                  ),
                  child: Center(
                    child: Text(
                      '${widget.index + 1}',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: widget.roadmap.color,
                      ),
                    ),
                  ),
                ),
                // Line
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: widget.roadmap.color.withOpacity(0.2),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () => setState(() => _expanded = !_expanded),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: widget.cardColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _expanded
                          ? widget.roadmap.color.withOpacity(0.3)
                          : widget.border.withOpacity(0.4),
                    ),
                    boxShadow: _expanded
                        ? [
                            BoxShadow(
                              color: widget.roadmap.color.withOpacity(0.08),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title row
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.step.title,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: widget.textPrimary,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: widget.roadmap.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              widget.step.duration,
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: widget.roadmap.color,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      // Description
                      Text(
                        widget.step.description,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: widget.textMuted,
                          height: 1.4,
                        ),
                      ),
                      // Expanded skills
                      AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Text(
                              'Skills to Master',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: widget.textPrimary,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 6,
                              runSpacing: 6,
                              children: widget.step.skills.map((skill) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: widget.roadmap.color.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: widget.roadmap.color.withOpacity(0.15),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle_rounded,
                                        size: 12,
                                        color: widget.roadmap.color,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        skill,
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: widget.textPrimary,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        crossFadeState: _expanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: const Duration(milliseconds: 250),
                      ),
                      // Expand hint
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedRotation(
                            turns: _expanded ? 0.5 : 0,
                            duration: const Duration(milliseconds: 250),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 18,
                              color: widget.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
