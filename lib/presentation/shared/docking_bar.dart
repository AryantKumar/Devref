import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class DockingBar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF0F172A).withValues(alpha: 0.9), // Darker navbar
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.05),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            blurRadius: 30,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(icons.length, (i) {
          final isActive = i == currentIndex;
          return _DockItem(
            icon: icons[i],
            isActive: isActive,
            onTap: () => onTap(i),
          );
        }),
      ),
    );
  }
}

class _DockItem extends StatelessWidget {
  final IconData icon;
  final bool isActive;
  final VoidCallback onTap;

  const _DockItem({
    required this.icon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive 
              ? AppColors.neonGlowCyan.withValues(alpha: 0.1) 
              : Colors.transparent,
          boxShadow: isActive ? [
            BoxShadow(
              color: AppColors.neonGlowCyan.withValues(alpha: 0.15),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ] : null,
        ),
        child: AnimatedScale(
          scale: isActive ? 1.15 : 1.0,
          duration: const Duration(milliseconds: 300),
          child: Icon(
            icon,
            size: 24,
            color: isActive 
                ? AppColors.neonGlowCyan 
                : Colors.white.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}
