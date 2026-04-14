import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/seed/seed_manager.dart';
import '../shared/glass_card.dart';
import './widgets/background_grid.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _mainController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOutCubic),
      ),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 0.8).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.2, 1.0, curve: Curves.easeInOut),
      ),
    );

    _startAnimationSequence();
  }

  Future<void> _startAnimationSequence() async {
    // Start seeding in background
    final seedFuture = SeedManager.seedIfNeeded().catchError((e) {
      debugPrint('Seeding error: $e');
    });

    _mainController.forward();

    // Ensure animation plays for a minimum time
    await Future.delayed(const Duration(milliseconds: 2500));

    // Wait for seeding to finish (with timeout)
    await seedFuture.timeout(
      const Duration(seconds: 15),
      onTimeout: () => debugPrint('Seeding timed out'),
    );

    if (mounted) {
      context.go('/');
    }
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF03090B), // Deepest teal-black
      body: Stack(
        alignment: Alignment.center,
        children: [
          // 1. Radial Background Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Color(0xFF0C2424), // Subtle teal core
                  Color(0xFF03090B), // Deep black outer
                ],
              ),
            ),
          ),

          // 2. Geometric Grid Pattern
          const BackgroundGrid(
            color: Color(0xFF81ECFF),
            opacity: 0.04,
            spacing: 24,
          ),

          // 3. Center Content
          FadeTransition(
            opacity: _fadeAnimation,
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Glass Card with Logo
                  _buildLogoCard(),
                  const SizedBox(height: 100),
                  
                  // Tactical Info
                  _buildTacticalInfo(),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),

          // 4. Bottom Loading Bar
          Positioned(
            bottom: 80,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: _buildSystemLoader(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoCard() {
    return Container(
      width: 280,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xFF81ECFF).withOpacity(0.1),
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF81ECFF).withOpacity(0.05),
            blurRadius: 40,
            spreadRadius: 2,
          ),
        ],
      ),
      child: GlassCard(
        blur: 15,
        opacity: 0.15,
        borderRadius: 24,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF81ECFF), Color(0xFFAC89FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                'DevRef',
                style: GoogleFonts.inter(
                  fontSize: 52,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -1.5,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'THE POCKET CODE REFERENCE',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 4.0,
                color: const Color(0xFFAC89FF).withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTacticalInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTacticalBadge(Icons.terminal_rounded, 'v4.0.2_STABLE'),
        const SizedBox(width: 24),
        Container(width: 1, height: 12, color: Colors.white10),
        const SizedBox(width: 24),
        _buildTacticalBadge(Icons.hub_rounded, 'ENCRYPTED_FLOW'),
      ],
    );
  }

  Widget _buildTacticalBadge(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF81ECFF).withOpacity(0.7)),
        const SizedBox(width: 8),
        Text(
          text,
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.4),
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildSystemLoader() {
    return Column(
      children: [
        // Progress Bar with Neon Glow
        AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, _) => Container(
            width: 220,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                FractionallySizedBox(
                  widthFactor: _progressAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF81ECFF),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF81ECFF).withOpacity(0.5),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'ESTABLISHING SYSTEM LINK',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 2.0,
            color: Colors.white.withOpacity(0.4),
          ),
        ),
      ],
    );
  }
}
