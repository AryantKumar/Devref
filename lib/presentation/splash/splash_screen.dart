import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/seed/seed_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _bgController;
  late final AnimationController _logoController;
  late final AnimationController _textController;

  late final Animation<double> _orbScale1;
  late final Animation<double> _orbScale2;
  late final Animation<double> _orbOpacity;

  late final Animation<double> _logoScale;
  late final Animation<double> _logoOpacity;
  late final Animation<double> _logoRotation;

  late final Animation<double> _titleOpacity;
  late final Animation<double> _titleSlide;
  late final Animation<double> _taglineOpacity;
  late final Animation<double> _progressOpacity;

  @override
  void initState() {
    super.initState();

    // Layer 1: Background orbs
    _bgController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _orbScale1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _bgController, curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic)),
    );
    _orbScale2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _bgController, curve: const Interval(0.15, 0.7, curve: Curves.easeOutCubic)),
    );
    _orbOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _bgController, curve: const Interval(0.0, 0.4, curve: Curves.easeIn)),
    );

    // Layer 2: Logo
    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _logoScale = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.elasticOut),
    );
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: const Interval(0.0, 0.4, curve: Curves.easeIn)),
    );
    _logoRotation = Tween<double>(begin: -0.1, end: 0.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutCubic),
    );

    // Layer 3: Text
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _titleOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: const Interval(0.0, 0.5, curve: Curves.easeIn)),
    );
    _titleSlide = Tween<double>(begin: 20.0, end: 0.0).animate(
      CurvedAnimation(parent: _textController, curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic)),
    );
    _taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: const Interval(0.3, 0.7, curve: Curves.easeIn)),
    );
    _progressOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _textController, curve: const Interval(0.5, 1.0, curve: Curves.easeIn)),
    );

    _startAnimationSequence();
  }

  Future<void> _startAnimationSequence() async {
    // Start seeding in background while animation plays
    final seedFuture = SeedManager.seedIfNeeded().catchError((e) {
      debugPrint('Seeding error: $e');
    });

    // Layer 1 starts immediately
    _bgController.forward();
    await Future.delayed(const Duration(milliseconds: 400));

    // Layer 2 starts
    _logoController.forward();
    await Future.delayed(const Duration(milliseconds: 600));

    // Layer 3 starts
    _textController.forward();
    await Future.delayed(const Duration(milliseconds: 1500));

    // Wait for seeding to finish (with timeout so we don't hang)
    await seedFuture.timeout(
      const Duration(seconds: 15),
      onTimeout: () => debugPrint('Seeding timed out'),
    );

    // Navigate
    if (mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    _bgController.dispose();
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: Stack(
        children: [
          // ── Layer 1: Animated gradient orbs ──
          AnimatedBuilder(
            animation: _bgController,
            builder: (context, _) => Stack(
              children: [
                Positioned(
                  top: size.height * 0.15,
                  left: -size.width * 0.2,
                  child: Opacity(
                    opacity: _orbOpacity.value,
                    child: Transform.scale(
                      scale: _orbScale1.value,
                      child: Container(
                        width: size.width * 0.7,
                        height: size.width * 0.7,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              AppColors.darkAccent.withValues(alpha: 0.3),
                              AppColors.darkAccent.withValues(alpha: 0.05),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.1,
                  right: -size.width * 0.15,
                  child: Opacity(
                    opacity: _orbOpacity.value,
                    child: Transform.scale(
                      scale: _orbScale2.value,
                      child: Container(
                        width: size.width * 0.6,
                        height: size.width * 0.6,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xFFD2A8FF).withValues(alpha: 0.25),
                              const Color(0xFFD2A8FF).withValues(alpha: 0.05),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.5,
                  left: size.width * 0.3,
                  child: Opacity(
                    opacity: _orbOpacity.value * 0.6,
                    child: Transform.scale(
                      scale: _orbScale1.value * 0.8,
                      child: Container(
                        width: size.width * 0.4,
                        height: size.width * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: RadialGradient(
                            colors: [
                              const Color(0xFF7EE787).withValues(alpha: 0.2),
                              const Color(0xFF7EE787).withValues(alpha: 0.03),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Layer 2 + 3: Logo and Text ──
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo
                AnimatedBuilder(
                  animation: _logoController,
                  builder: (context, child) => Opacity(
                    opacity: _logoOpacity.value,
                    child: Transform.scale(
                      scale: _logoScale.value,
                      child: Transform.rotate(
                        angle: _logoRotation.value,
                        child: child,
                      ),
                    ),
                  ),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF58A6FF),
                          Color(0xFFD2A8FF),
                          Color(0xFF7EE787),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkAccent.withValues(alpha: 0.4),
                          blurRadius: 30,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        '</>',
                        style: GoogleFonts.firaCode(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 28),

                // Title
                AnimatedBuilder(
                  animation: _textController,
                  builder: (context, _) => Opacity(
                    opacity: _titleOpacity.value,
                    child: Transform.translate(
                      offset: Offset(0, _titleSlide.value),
                      child: Text(
                        'DevRef',
                        style: GoogleFonts.inter(
                          fontSize: 36,
                          fontWeight: FontWeight.w800,
                          color: AppColors.darkTextPrimary,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Tagline
                AnimatedBuilder(
                  animation: _textController,
                  builder: (context, _) => Opacity(
                    opacity: _taglineOpacity.value,
                    child: Text(
                      'Your pocket code reference',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkTextMuted,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 48),

                // Progress indicator
                AnimatedBuilder(
                  animation: _textController,
                  builder: (context, _) => Opacity(
                    opacity: _progressOpacity.value,
                    child: SizedBox(
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: const LinearProgressIndicator(
                          minHeight: 3,
                          backgroundColor: AppColors.darkCard,
                          color: AppColors.darkAccent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
