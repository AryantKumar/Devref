import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../../data/models/snippet.dart';
import '../shared/code_block_widget.dart';
import '../shared/difficulty_badge.dart';

class QuizPlayScreen extends ConsumerStatefulWidget {
  final String topicId;
  const QuizPlayScreen({super.key, required this.topicId});

  @override
  ConsumerState<QuizPlayScreen> createState() => _QuizPlayScreenState();
}

class _QuizPlayScreenState extends ConsumerState<QuizPlayScreen> {
  List<Snippet> _questions = [];
  int _currentIndex = 0;
  int _score = 0;
  int? _selectedOption;
  bool _answered = false;
  final List<Map<String, dynamic>> _answers = [];
  final List<List<String>> _options = [];
  final List<int> _correctIndices = [];
  bool _loading = true;

  static const _questionTemplates = [
    'What does this code do?',
    'What is the output of this code?',
    'What concept does this demonstrate?',
  ];

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    final snippets = await ref.read(topicSnippetsProvider(widget.topicId).future);
    final rng = Random();
    final shuffled = List<Snippet>.from(snippets)..shuffle(rng);
    _questions = shuffled.take(10).toList();

    for (var q in _questions) {
      // Correct answer from snippet description/title
      final correct = q.title;
      // Wrong options from other snippets
      final others = snippets.where((s) => s.snippetId != q.snippetId).toList()..shuffle(rng);
      final wrongs = others.take(3).map((s) => s.title).toList();

      final allOptions = [correct, ...wrongs]..shuffle(rng);
      _options.add(allOptions);
      _correctIndices.add(allOptions.indexOf(correct));
    }

    setState(() => _loading = false);
  }

  void _selectOption(int index) {
    if (_answered) return;
    setState(() {
      _selectedOption = index;
      _answered = true;
      final isCorrect = index == _correctIndices[_currentIndex];
      if (isCorrect) _score++;
      _answers.add({
        'question': _questions[_currentIndex].title,
        'correct': isCorrect,
        'selectedAnswer': _options[_currentIndex][index],
        'correctAnswer': _options[_currentIndex][_correctIndices[_currentIndex]],
      });
    });
  }

  void _nextQuestion() {
    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
        _selectedOption = null;
        _answered = false;
      });
    } else {
      context.pushReplacement(
        '/quiz/${widget.topicId}/result',
        extra: {'score': _score, 'total': _questions.length, 'answers': _answers},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final q = _questions[_currentIndex];
    final qTemplate = _questionTemplates[_currentIndex % _questionTemplates.length];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${_currentIndex + 1}/${_questions.length}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text('Score: $_score', style: theme.textTheme.titleMedium),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress
            LinearProgressIndicator(
              value: (_currentIndex + 1) / _questions.length,
              backgroundColor: isDark ? AppColors.darkBorder : AppColors.lightBorder,
              color: isDark ? AppColors.darkAccent : AppColors.lightAccent,
            ),
            const SizedBox(height: 16),

            // Difficulty badge
            DifficultyBadge(difficulty: q.difficulty),
            const SizedBox(height: 12),

            // Code block
            CodeBlockWidget(code: q.code, language: q.language),
            const SizedBox(height: 16),

            // Question
            Text(qTemplate, style: theme.textTheme.titleLarge),
            const SizedBox(height: 16),

            // Options
            ...List.generate(_options[_currentIndex].length, (i) {
              final isSelected = _selectedOption == i;
              final isCorrect = i == _correctIndices[_currentIndex];

              Color? bgColor;
              Color? borderColor;
              if (_answered) {
                if (isCorrect) {
                  bgColor = AppColors.diffVeryEasyBg.withValues(alpha: 0.2);
                  borderColor = AppColors.diffVeryEasyBg;
                } else if (isSelected) {
                  bgColor = AppColors.diffVeryHardBg.withValues(alpha: 0.2);
                  borderColor = AppColors.diffVeryHardBg;
                }
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: GestureDetector(
                  onTap: () => _selectOption(i),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: bgColor ?? (isDark ? AppColors.darkCard : AppColors.lightCard),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: borderColor ?? (isDark ? AppColors.darkBorder : AppColors.lightBorder),
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text(_options[_currentIndex][i], style: theme.textTheme.bodyLarge)),
                        if (_answered && isCorrect)
                          const Icon(Icons.check_circle, color: AppColors.diffVeryEasyBg, size: 20),
                        if (_answered && isSelected && !isCorrect)
                          const Icon(Icons.cancel, color: AppColors.diffVeryHardBg, size: 20),
                      ],
                    ),
                  ),
                ),
              );
            }),

            // Explanation
            if (_answered) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: (isDark ? AppColors.darkSurface : AppColors.lightSurface),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Explanation', style: theme.textTheme.titleMedium),
                    const SizedBox(height: 4),
                    Text(q.description, style: theme.textTheme.bodyMedium?.copyWith(
                      color: isDark ? AppColors.darkTextMuted : AppColors.lightTextMuted,
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextQuestion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark ? AppColors.darkAccent : AppColors.lightAccent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(_currentIndex < _questions.length - 1 ? 'Next' : 'See Results'),
                ),
              ),
            ],
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
