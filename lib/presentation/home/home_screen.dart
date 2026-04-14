import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../../domain/providers/theme_provider.dart';
import '../../data/models/topic.dart';
import '../../data/models/snippet.dart';
import '../shared/topic_icon.dart';
import '../shared/mastery_progress_bar.dart';
import '../shared/glass_card.dart';
import '../shared/skeleton_topic_card.dart';
import '../shared/custom_error_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    return 'Good Evening';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topicsAsync = ref.watch(allTopicsProvider);
    final recentAsync = ref.watch(recentSnippetsProvider);
    final themeState = ref.watch(themeProvider);
    final theme = Theme.of(context);
    final greeting = _getGreeting();

    return Scaffold(
      body: Stack(
        children: [
          // Main Scrollable Content
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── Header (Glassmorphic) ──
              _buildHeader(context, ref, themeState),

              // ── Greeting Section ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '$greeting, ', style: theme.textTheme.headlineMedium),
                            TextSpan(
                              text: 'Aryant',
                              style: theme.textTheme.headlineMedium?.copyWith(color: AppColors.neuralPrimary),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Ready to architect your next breakthrough?',
                        style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.darkTextMuted),
                      ),
                    ],
                  ),
                ),
              ),

              // ── Command Search Bar ──
              SliverToBoxAdapter(
                child: _buildCommandSearchBar(context),
              ),

              // ── Core Knowledge (Bento Grid) ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                  child: Row(
                    children: [
                      Text(
                        'CORE KNOWLEDGE',
                        style: GoogleFonts.spaceGrotesk(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 2,
                          color: AppColors.neuralPrimary.withOpacity(0.8),
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () => context.go('/browse'),
                        child: Row(
                          children: [
                            Text(
                              'VIEW_ALL',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: AppColors.neuralTertiary,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Icon(Icons.arrow_forward_rounded, size: 14, color: AppColors.neuralTertiary),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              topicsAsync.when(
                data: (topics) => SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  sliver: SliverGrid(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 1.1,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final featured = ['kotlin', 'python', 'javascript', 'rust'];
                        late Topic topic;
                        if (index < featured.length) {
                          topic = topics.firstWhere((t) => t.topicId == featured[index], orElse: () => topics[index]);
                        } else {
                          topic = topics[index];
                        }
                        return _BentoTopicCard(topic: topic);
                      },
                      childCount: 4,
                    ),
                  ),
                ),
                loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator())),
                error: (e, _) => SliverToBoxAdapter(child: CustomErrorWidget(message: e.toString())),
              ),

              // ── Recently Accessed (Horizontal) ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
                  child: Text(
                    'RECENTLY ACCESSED',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 2,
                      color: AppColors.neuralPrimary.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 180,
                  child: recentAsync.when(
                    data: (snippets) => ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      itemCount: snippets.length,
                      itemBuilder: (context, index) => _RecentSnippetCard(snippet: snippets[index]),
                    ),
                    loading: () => const SizedBox.shrink(),
                    error: (_, __) => const SizedBox.shrink(),
                  ),
                ),
              ),

              // ── Feature Promo Banner ──
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 32, 24, 120),
                  child: _buildPromoBanner(),
                ),
              ),
            ],
          ),

          // ── Contextual FAB ──
          Positioned(
            bottom: 100,
            right: 24,
            child: _buildFAB(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, WidgetRef ref, themeState) {
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: true,
      expandedHeight: 70,
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: AppColors.darkBackground.withValues(alpha: 0.8),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.neuralPrimary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.neuralPrimary.withValues(alpha: 0.3)),
                    ),
                    child: const Icon(Icons.psychology_rounded, size: 20, color: AppColors.neuralPrimary),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'DevRef',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  // Theme Toggle
                  GestureDetector(
                    onTap: () => ref.read(themeProvider.notifier).toggleTheme(theme.brightness != Brightness.dark),
                    child: Container(
                      height: 32,
                      width: 64,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white.withOpacity(0.1)),
                      ),
                      child: Stack(
                        children: [
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 200),
                            alignment: theme.brightness == Brightness.dark 
                                ? Alignment.centerLeft 
                                : Alignment.centerRight,
                            child: Container(
                              margin: const EdgeInsets.all(2),
                              width: 28,
                              height: 28,
                              decoration: const BoxDecoration(
                                color: AppColors.neuralPrimary,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                theme.brightness == Brightness.dark ? Icons.dark_mode : Icons.light_mode,
                                size: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  IconButton(
                    onPressed: () => context.go('/search'),
                    icon: const Icon(Icons.search_rounded, color: Colors.white70, size: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCommandSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      child: GestureDetector(
        onTap: () => context.go('/search'),
        child: GlassCard(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          color: AppColors.neuralSurfaceContainerHigh.withOpacity(0.4),
          borderRadius: 14,
          borderColor: Colors.white.withOpacity(0.05),
          child: Row(
            children: [
              const Icon(Icons.terminal_rounded, color: Colors.white54, size: 20),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  'Search documentation...',
                  style: GoogleFonts.inter(color: Colors.white38, fontSize: 14),
                ),
              ),
              const Icon(Icons.mic_none_rounded, color: AppColors.neuralPrimary, size: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1639322537228-f710d846310a?q=80&w=1000&auto=format&fit=crop'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BETA_FEATURE_LIVE',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                    color: AppColors.neuralTertiary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Neural Code Search',
                  style: GoogleFonts.spaceGrotesk(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Query documentation using natural language.',
                  style: GoogleFonts.inter(fontSize: 13, color: Colors.white70),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.neuralPrimary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    'Try Now',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.neuralOnPrimaryContainer,
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

  Widget _buildFAB() {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF81ECFF), Color(0xFFAC89FF), Color(0xFFAAFFDC)],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF81ECFF).withOpacity(0.4),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: const Center(
            child: Icon(Icons.add_rounded, color: Color(0xFF005762), size: 32),
          ),
        ),
      ),
    );
  }
}

class _BentoTopicCard extends StatelessWidget {
  final Topic topic;
  const _BentoTopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = AppColors.topicColor(topic.topicId);

    // Mock metadata for design match
    String subtitle = '${topic.snippetCount} Snippets';
    if (topic.topicId == 'kotlin') subtitle = '1.9.20 Stable';
    if (topic.topicId == 'python') subtitle = '3.12 Reference';
    if (topic.topicId == 'javascript') subtitle = 'ES2024 Specs';
    if (topic.topicId == 'rust') subtitle = 'Memory Safety';

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push('/browse/${topic.topicId}'),
      child: GlassCard(
        padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
        color: AppColors.neuralSurfaceContainerHigh.withOpacity(0.4),
        borderRadius: 14,
        accentColor: color,
        accentWidth: 3,
        borderColor: Colors.white.withOpacity(0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TopicIcon(topic: topic, size: 24),
            ),
            const Spacer(),
            Text(
              topic.name, 
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: Colors.white38,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RecentSnippetCard extends StatelessWidget {
  final Snippet snippet;
  const _RecentSnippetCard({required this.snippet});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = AppColors.topicColor(snippet.topicId);

    return Container(
      width: 260,
      margin: const EdgeInsets.only(right: 16),
      child: GlassCard(
        padding: const EdgeInsets.all(16),
        color: AppColors.neuralSurfaceContainerHigh,
        opacity: 0.7,
        borderRadius: 16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    snippet.language.toUpperCase(),
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 9,
                      fontWeight: FontWeight.w700,
                      color: color,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(Icons.history_rounded, color: AppColors.darkTextMuted, size: 16),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                snippet.code.trim().split('\n').first,
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  color: AppColors.neuralPrimary.withOpacity(0.8),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Text(
              snippet.title,
              style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              'Last viewed by you',
              style: theme.textTheme.bodySmall?.copyWith(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}

// Global text theme helper for inner widgets if needed
TextTheme get themeTextTheme => GoogleFonts.interTextTheme();
