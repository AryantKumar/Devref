import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../data/models/snippet.dart';
import '../../data/datasources/isar_datasource.dart';
import '../../domain/providers/providers.dart';
import '../shared/code_block_widget.dart';
import '../shared/glass_card.dart';

class SnippetDetailScreen extends ConsumerStatefulWidget {
  final String snippetId;
  const SnippetDetailScreen({super.key, required this.snippetId});

  @override
  ConsumerState<SnippetDetailScreen> createState() => _SnippetDetailScreenState();
}
class _SnippetDetailScreenState extends ConsumerState<SnippetDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Update lastViewedAt
    IsarDatasource.updateLastViewed(widget.snippetId).then((_) {
      ref.invalidate(recentSnippetsProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final snippetAsync = ref.watch(snippetByIdProvider(widget.snippetId));
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: snippetAsync.when(
        data: (snippet) {
          if (snippet == null) return const Center(child: Text('Snippet not found'));
          return CustomScrollView(
            slivers: [
              _buildHeader(context, snippet),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 24),
                      _buildCodeSection(context, snippet),
                      const SizedBox(height: 32),
                      _buildMetadataSection(context, snippet),
                      const SizedBox(height: 48),
                      _buildRelatedSection(context, snippet),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, Snippet snippet) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      expandedHeight: 120,
      pinned: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 18),
        onPressed: () => Navigator.pop(context),
      ),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 64, bottom: 20),
        title: Text(
          snippet.title,
          style: GoogleFonts.spaceGrotesk(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.topicColor(snippet.topicId).withOpacity(0.15),
                AppColors.darkBackground,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeSection(BuildContext context, Snippet snippet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              'SOURCE_CODE.sh',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.white24,
                letterSpacing: 1.0,
              ),
            ),
            _buildCopyButton(context, snippet.code),
          ],
        ),
        const SizedBox(height: 12),
        CodeBlockWidget(code: snippet.code, language: snippet.language),
      ],
    );
  }

  Widget _buildCopyButton(BuildContext context, String code) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Snippet copied to clipboard', style: GoogleFonts.inter(fontSize: 13)),
            backgroundColor: AppColors.darkCard,
            duration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.white.withOpacity(0.1)),
        ),
        child: Row(
          children: [
            const Icon(Icons.copy_rounded, size: 14, color: AppColors.neonGlowCyan),
            const SizedBox(width: 6),
            Text(
              'COPY',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.neonGlowCyan,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetadataSection(BuildContext context, Snippet snippet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EXPLANATION',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: AppColors.neonGlowCyan.withOpacity(0.5),
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          snippet.description,
          style: GoogleFonts.inter(
            fontSize: 15,
            color: Colors.white70,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedSection(BuildContext context, Snippet snippet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RELATED_INTELLIGENCE',
          style: GoogleFonts.jetBrainsMono(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.white24,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 20),
        _RelatedSnippets(topicId: snippet.topicId, excludeId: snippet.snippetId),
      ],
    );
  }
}

class _RelatedSnippets extends ConsumerWidget {
  final String topicId;
  final String excludeId;

  const _RelatedSnippets({required this.topicId, required this.excludeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snippetsAsync = ref.watch(topicSnippetsProvider(topicId));

    return snippetsAsync.when(
      data: (snippets) {
        final filtered = snippets.where((s) => s.snippetId != excludeId).take(3).toList();
        if (filtered.isEmpty) return const SizedBox.shrink();

        return Column(
          children: filtered.map((s) => _RelatedCard(snippet: s)).toList(),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _RelatedCard extends StatelessWidget {
  final Snippet snippet;
  const _RelatedCard({required this.snippet});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () => context.pushReplacement('/snippet/${snippet.snippetId}'),
        child: GlassCard(
          padding: const EdgeInsets.all(16),
          color: Colors.white.withOpacity(0.02),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: AppColors.topicColor(snippet.topicId).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.code_rounded, size: 16, color: Colors.white70),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      snippet.title,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      snippet.language.toUpperCase(),
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 9,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Colors.white24),
            ],
          ),
        ),
      ),
    );
  }
}
