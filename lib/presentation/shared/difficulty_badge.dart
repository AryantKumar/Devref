import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class DifficultyBadge extends StatelessWidget {
  final String difficulty;
  const DifficultyBadge({super.key, required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.difficultyBg(difficulty),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        AppColors.difficultyLabel(difficulty),
        style: TextStyle(
          color: AppColors.difficultyText(difficulty),
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
