import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../shared/code_block_widget.dart';
import '../shared/custom_error_widget.dart';
import '../shared/glass_card.dart';

class SectionDetailScreen extends ConsumerWidget {
  final String topicId;
  final String section;

  const SectionDetailScreen({
    super.key,
    required this.topicId,
    required this.section,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final snippetsAsync = ref.watch(
      sectionSnippetsProvider((topicId: topicId, section: section)),
    );
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: AppColors.darkBackground.withValues(alpha: 0.7),
            ),
          ),
        ),
        leading: BackButton(color: Colors.white70),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SECTION_CONTENT',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: AppColors.neuralPrimary,
                letterSpacing: 2,
              ),
            ),
            Text(
              section,
              style: GoogleFonts.spaceGrotesk(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: snippetsAsync.when(
        data: (snippets) {
          if (snippets.isEmpty) {
            return const Center(child: Text('No snippets in this section', style: TextStyle(color: Colors.white54)));
          }
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 120, 16, 100),
            physics: const BouncingScrollPhysics(),
            itemCount: snippets.length,
            itemBuilder: (context, index) {
              final snippet = snippets[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: InkWell(
                  onTap: () => context.push('/snippet/${snippet.snippetId}'),
                  borderRadius: BorderRadius.circular(16),
                  child: GlassCard(
                    padding: const EdgeInsets.all(20),
                    color: AppColors.neuralSurfaceContainerHigh.withOpacity(0.3),
                    borderRadius: 16,
                    borderColor: Colors.white.withOpacity(0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ── Header ──
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                snippet.title,
                                style: GoogleFonts.spaceGrotesk(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.bolt_rounded,
                              size: 18,
                              color: AppColors.neuralPrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
  
                        // ── Code Block Preview ──
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: IgnorePointer(
                            child: CodeBlockWidget(
                              code: snippet.code,
                              language: snippet.language,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
  
                        // ── Description ──
                        Text(
                          snippet.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            height: 1.6,
                            color: AppColors.darkTextMuted,
                          ),
                        ),
                        const SizedBox(height: 16),
                        
                        // ── Footer ──
                        Row(
                          children: [
                            Text(
                              'VIEW_FULL_INTELLIGENCE',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: AppColors.neuralTertiary,
                                letterSpacing: 1,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 10,
                              color: Colors.white24,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => CustomErrorWidget(message: e.toString()),
      ),
    );
  }
}
