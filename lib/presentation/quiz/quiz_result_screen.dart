import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';

class QuizResultScreen extends StatelessWidget {
  final String topicId;
  final int score;
  final int total;
  final List<Map<String, dynamic>> answers;

  const QuizResultScreen({
    super.key,
    required this.topicId,
    required this.score,
    required this.total,
    required this.answers,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final percentage = (score / total * 100).round();
    final isGood = percentage >= 70;

    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Score circle
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: (isGood ? AppColors.diffVeryEasyBg : AppColors.diffVeryHardBg).withValues(alpha: 0.15),
                border: Border.all(
                  color: isGood ? AppColors.diffVeryEasyBg : AppColors.diffVeryHardBg,
                  width: 3,
                ),
              ),
              child: Center(
                child: Text(
                  '$score/$total',
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: isGood ? AppColors.diffVeryEasyText : AppColors.diffVeryHardText,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              isGood ? 'Great job! 🎉' : 'Keep practicing! 💪',
              style: theme.textTheme.headlineMedium,
            ),
            Text(
              '$percentage% correct',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
              ),
            ),
            const SizedBox(height: 24),

            // Breakdown
            ...answers.asMap().entries.map((e) {
              final idx = e.key;
              final a = e.value;
              final correct = a['correct'] as bool;
              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkCard : AppColors.lightCard,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                ),
                child: Row(
                  children: [
                    Icon(
                      correct ? Icons.check_circle : Icons.cancel,
                      color: correct ? AppColors.diffVeryEasyBg : AppColors.diffVeryHardBg,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Q${idx + 1}: ${a['question']}',
                            style: theme.textTheme.bodyMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                          if (!correct)
                            Text('Correct: ${a['correctAnswer']}',
                              style: theme.textTheme.bodySmall?.copyWith(color: AppColors.diffVeryEasyBg)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),

            const SizedBox(height: 24),
            // Buttons
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.go('/quiz'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Change Language'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => context.pushReplacement('/quiz/$topicId/play'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text('Retry'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
