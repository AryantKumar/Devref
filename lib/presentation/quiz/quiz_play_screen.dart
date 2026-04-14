import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../../data/models/snippet.dart';
import '../shared/code_block_widget.dart';
import '../shared/difficulty_badge.dart';
import '../shared/glass_card.dart';
import '../shared/mastery_progress_bar.dart';

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
      return const Scaffold(
        backgroundColor: AppColors.darkBackground,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final q = _questions[_currentIndex];
    final qTemplate = _questionTemplates[_currentIndex % _questionTemplates.length];

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          children: [
            _buildSessionHeader(context),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    _buildProgressBar(),
                    const SizedBox(height: 24),
                    _buildQuestionCard(context, q, qTemplate),
                    const SizedBox(height: 32),
                    _buildOptionsList(context),
                    if (_answered) _buildExplanation(context, q),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSessionHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 12),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.close_rounded, color: Colors.white54),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'CURRENT SESSION',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: Colors.white24,
                ),
              ),
              Text(
                'Lvl 42 Architect',
                style: GoogleFonts.spaceGrotesk(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: AppColors.neonGlowCyan,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          _buildStatIndicator('+450', AppColors.xpRewardGold, 'XP REWARD'),
          const SizedBox(width: 12),
          _buildStatIndicator('x5', AppColors.neonGlowPurple, 'STREAK'),
        ],
      ),
    );
  }

  Widget _buildStatIndicator(String value, Color color, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 7,
            fontWeight: FontWeight.w700,
            color: Colors.white24,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: color.withOpacity(0.2)),
          ),
          child: Text(
            value,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBar() {
    final progress = (_currentIndex + 1) / _questions.length;
    return MasteryProgressBar(
      progress: progress,
      color: AppColors.neonGlowPurple,
    );
  }

  Widget _buildQuestionCard(BuildContext context, Snippet q, String template) {
    return GlassCard(
      padding: EdgeInsets.zero,
      color: const Color(0xFF0F172A).withOpacity(0.5),
      borderRadius: 16,
      borderColor: Colors.white.withOpacity(0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Row(
              children: [
                _buildDot(const Color(0xFFFF5F56)),
                const SizedBox(width: 8),
                _buildDot(const Color(0xFFFFBD2E)),
                const SizedBox(width: 8),
                _buildDot(const Color(0xFF27C93F)),
                const Spacer(),
                Text(
                  'BRAIN_DUMP.sh',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: Colors.white24,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: Colors.white12),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  template,
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                CodeBlockWidget(code: q.code, language: q.language),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  Widget _buildOptionsList(BuildContext context) {
    return Column(
      children: List.generate(_options[_currentIndex].length, (i) {
        final option = _options[_currentIndex][i];
        final isSelected = _selectedOption == i;
        final isCorrect = i == _correctIndices[_currentIndex];
        
        Color borderColor = Colors.white.withOpacity(0.05);
        Color backgroundColor = Colors.white.withOpacity(0.02);
        Color textColor = Colors.white70;

        if (isSelected) {
          borderColor = AppColors.neonGlowCyan;
          backgroundColor = AppColors.neonGlowCyan.withOpacity(0.1);
          textColor = AppColors.neonGlowCyan;
        }

        if (_answered) {
          if (isCorrect) {
            borderColor = AppColors.successEmerald;
            backgroundColor = AppColors.successEmerald.withOpacity(0.1);
            textColor = AppColors.successEmerald;
          } else if (isSelected) {
            borderColor = Colors.redAccent;
            backgroundColor = Colors.redAccent.withOpacity(0.1);
            textColor = Colors.redAccent;
          }
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: InkWell(
            onTap: () => _selectOption(i),
            borderRadius: BorderRadius.circular(100),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: borderColor.withOpacity(0.5)),
                    ),
                    child: Center(
                      child: Text(
                        String.fromCharCode(65 + i),
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      option,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: textColor,
                      ),
                    ),
                  ),
                  if (_answered && isCorrect)
                    const Icon(Icons.check_circle_rounded, color: AppColors.successEmerald, size: 20),
                  if (_answered && isSelected && !isCorrect)
                    const Icon(Icons.cancel_rounded, color: Colors.redAccent, size: 20),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildExplanation(BuildContext context, Snippet q) {
    final isCorrect = _selectedOption == _correctIndices[_currentIndex];

    return Column(
      children: [
        const SizedBox(height: 32),
        GlassCard(
          padding: const EdgeInsets.all(24),
          color: isCorrect ? AppColors.successEmerald.withOpacity(0.05) : Colors.redAccent.withOpacity(0.05),
          borderColor: isCorrect ? AppColors.successEmerald.withOpacity(0.2) : Colors.redAccent.withOpacity(0.2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    isCorrect ? Icons.auto_awesome_rounded : Icons.info_outline_rounded,
                    color: isCorrect ? AppColors.successEmerald : Colors.redAccent,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    isCorrect ? 'BRILLIANT, SENIOR!' : 'ALMOST THERE, ARCHITECT',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: isCorrect ? AppColors.successEmerald : Colors.redAccent,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                isCorrect ? 'You analyzed the logic perfectly. +45 XP earned.' : 'The logic requires a more precise approach. Review below.',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: Colors.white10),
              const SizedBox(height: 16),
              Text(
                'EXPLANATION',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white24,
                  letterSpacing: 1.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                q.description,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _nextQuestion,
            style: ElevatedButton.styleFrom(
              backgroundColor: isCorrect ? AppColors.neonGlowCyan : Colors.white10,
              foregroundColor: isCorrect ? Colors.black : Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 18),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            ),
            child: Text(
              _currentIndex < _questions.length - 1 ? 'CONTINUE JOURNEY' : 'SEE ARCHITECT SUMMARY',
              style: GoogleFonts.spaceGrotesk(fontWeight: FontWeight.bold, letterSpacing: 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
