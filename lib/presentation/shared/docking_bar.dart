import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class DockingBar extends StatefulWidget {
  final int currentIndex;
  final List<IconData> icons;
  final ValueChanged<int> onTap;

  const DockingBar({
    super.key,
    required this.currentIndex,
    required this.icons,
    required this.onTap,
  });

  @override
  State<DockingBar> createState() => _DockingBarState();
}

class _DockingBarState extends State<DockingBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(DockingBar oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      clipBehavior: Clip.none,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.85),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.08),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 40,
            spreadRadius: 0,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: AppColors.neonGlowCyan.withValues(alpha: 0.05),
            blurRadius: 20,
            spreadRadius: -5,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(widget.icons.length, (i) {
          final isActive = i == widget.currentIndex;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () => widget.onTap(i),
              child: AnimatedScale(
                scale: isActive ? 1.25 : 1.0,
                duration: const Duration(milliseconds: 300),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      widget.icons[i],
                      size: 24,
                      color: isActive 
                          ? AppColors.neonGlowCyan 
                          : Colors.white.withValues(alpha: 0.4),
                    ),
                    if (isActive) ...[
                      const SizedBox(height: 6),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: AppColors.neonGlowCyan,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.neonGlowCyan.withValues(alpha: 0.8),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
                      const SizedBox(height: 10),
                    ],
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
