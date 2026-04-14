import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/roadmap_data.dart';
import '../../domain/providers/roadmap_provider.dart';
import '../shared/mastery_dial.dart';
import '../shared/glass_card.dart';

class RoadmapDetailScreen extends ConsumerWidget {
  final String roadmapId;
  const RoadmapDetailScreen({super.key, required this.roadmapId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final roadmap = roadmaps.firstWhere((r) => r.id == roadmapId);
    final completedSteps = ref.watch(roadmapProgressProvider);
    
    // Calculate actual progress based on completed steps
    final totalSteps = roadmap.steps.length;
    final completedCount = roadmap.steps.asMap().entries.where((e) => 
      completedSteps.contains('${roadmapId}_${e.key}')
    ).length;
    final progress = totalSteps > 0 ? completedCount / totalSteps : 0.0;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                MasteryDial(
                  progress: progress,
                  color: roadmap.color,
                  label: roadmap.title,
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final step = roadmap.steps[index];
                  final isLast = index == roadmap.steps.length - 1;
                  final isCompleted = ref.watch(roadmapProgressProvider).contains('${roadmapId}_$index');

                  return _TimelineItem(
                    roadmapId: roadmapId,
                    step: step,
                    index: index,
                    isLast: isLast,
                    isCompleted: isCompleted,
                    color: roadmap.color,
                  );
                },
                childCount: roadmap.steps.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}

class _TimelineItem extends ConsumerStatefulWidget {
  final String roadmapId;
  final RoadmapStep step;
  final int index;
  final bool isLast;
  final bool isCompleted;
  final Color color;

  const _TimelineItem({
    required this.roadmapId,
    required this.step,
    required this.index,
    required this.isLast,
    required this.isCompleted,
    required this.color,
  });

  @override
  ConsumerState<_TimelineItem> createState() => _TimelineItemState();
}

class _TimelineItemState extends ConsumerState<_TimelineItem> with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Color nodeColor = widget.isCompleted ? AppColors.successEmerald : widget.color.withOpacity(0.5);
    IconData nodeIcon = widget.isCompleted ? Icons.check_rounded : Icons.radio_button_unchecked_rounded;
    double opacity = widget.isCompleted ? 1.0 : (_isExpanded ? 1.0 : 0.7);

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline bar
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: nodeColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: nodeColor.withOpacity(0.5),
                      width: 1,
                    ),
                    boxShadow: widget.isCompleted ? [
                      BoxShadow(
                        color: nodeColor.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ] : null,
                  ),
                  child: Icon(nodeIcon, size: 14, color: nodeColor),
                ),
                if (!widget.isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            nodeColor.withOpacity(0.5),
                            nodeColor.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Content Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Opacity(
                opacity: opacity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MILESTONE 0${widget.index + 1}',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: widget.isCompleted ? nodeColor : Colors.white24,
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () => setState(() => _isExpanded = !_isExpanded),
                      child: GlassCard(
                        padding: const EdgeInsets.all(20),
                        color: AppColors.neuralSurfaceContainerHigh.withOpacity(0.3),
                        borderRadius: 14,
                        borderColor: widget.isCompleted ? nodeColor.withOpacity(0.2) : (_isExpanded ? widget.color.withOpacity(0.3) : Colors.white.withOpacity(0.05)),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          alignment: Alignment.topCenter,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      widget.step.title,
                                      style: GoogleFonts.spaceGrotesk(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        constraints: const BoxConstraints(),
                                        padding: EdgeInsets.zero,
                                        icon: Icon(
                                          widget.isCompleted ? Icons.check_circle_rounded : Icons.circle_outlined,
                                          color: widget.isCompleted ? AppColors.successEmerald : Colors.white24,
                                          size: 24,
                                        ),
                                        onPressed: () {
                                          ref.read(roadmapProgressProvider.notifier).toggleStep(widget.roadmapId, widget.index);
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                        _isExpanded ? Icons.keyboard_arrow_up_rounded : Icons.keyboard_arrow_down_rounded,
                                        color: Colors.white24,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                widget.step.description,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: Colors.white60,
                                  height: 1.5,
                                ),
                                maxLines: _isExpanded ? 100 : 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              if (_isExpanded) ...[
                                const SizedBox(height: 20),
                                Text(
                                  'SKILLS_TO_MASTER',
                                  style: GoogleFonts.jetBrainsMono(
                                    fontSize: 9,
                                    fontWeight: FontWeight.w800,
                                    color: widget.color.withOpacity(0.7),
                                    letterSpacing: 1.5,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: widget.step.skills.map((skill) => Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: widget.color.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: widget.color.withOpacity(0.1)),
                                    ),
                                    child: Text(
                                      skill,
                                      style: GoogleFonts.inter(
                                        fontSize: 11,
                                        color: Colors.white70,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )).toList(),
                                ),
                                if (widget.step.resources.isNotEmpty) ...[
                                  const SizedBox(height: 24),
                                  Text(
                                    'INTELLIGENCE_RESOURCES',
                                    style: GoogleFonts.jetBrainsMono(
                                      fontSize: 9,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.cyanAccent.withOpacity(0.6),
                                      letterSpacing: 1.5,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Column(
                                    children: widget.step.resources.map((res) => Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.link_rounded, size: 14, color: Colors.white24),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Text(
                                              res,
                                              style: GoogleFonts.inter(
                                                fontSize: 12,
                                                color: Colors.white54,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )).toList(),
                                  ),
                                ],
                              ],
                              if (widget.isCompleted && !_isExpanded) ...[
                                const SizedBox(height: 12),
                                Row(
                                  children: [
                                    const Icon(Icons.verified_rounded, color: AppColors.successEmerald, size: 14),
                                    const SizedBox(width: 8),
                                    Text(
                                      'COMPLETED',
                                      style: GoogleFonts.jetBrainsMono(
                                        fontSize: 9,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.successEmerald,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
