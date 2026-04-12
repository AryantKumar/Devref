import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/providers/providers.dart';
import '../shared/code_block_widget.dart';
import '../shared/custom_error_widget.dart';

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
      appBar: AppBar(
        title: Text(section),
      ),
      body: snippetsAsync.when(
        data: (snippets) {
          if (snippets.isEmpty) {
            return const Center(child: Text('No snippets in this section'));
          }
          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
            itemCount: snippets.length,
            itemBuilder: (context, index) {
              final snippet = snippets[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Title ──
                  Text(
                    snippet.title,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: isDark
                          ? AppColors.darkTextPrimary
                          : AppColors.lightTextPrimary,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Divider(
                    color: (isDark ? AppColors.darkBorder : AppColors.lightBorder)
                        .withOpacity(0.5),
                    height: 1,
                  ),
                  const SizedBox(height: 12),

                  // ── Code Block ──
                  CodeBlockWidget(
                    code: snippet.code,
                    language: snippet.language,
                  ),
                  const SizedBox(height: 12),

                  // ── Description ──
                  Text(
                    snippet.description,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      height: 1.6,
                      color: isDark
                          ? AppColors.darkTextMuted
                          : AppColors.lightTextMuted,
                    ),
                  ),

                  const SizedBox(height: 28),
                ],
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
