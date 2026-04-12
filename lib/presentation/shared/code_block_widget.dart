import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/code_theme.dart';

class CodeBlockWidget extends StatelessWidget {
  final String code;
  final String language;

  const CodeBlockWidget({
    super.key,
    required this.code,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.codeBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: HighlightView(
              code,
              language: _mapLanguage(language),
              theme: codeThemeData,
              textStyle: GoogleFonts.jetBrainsMono(
                fontSize: 13,
                height: 1.5,
              ),
              padding: EdgeInsets.zero,
            ),
          ),
        ),
      ),
    );
  }

  String _mapLanguage(String lang) {
    switch (lang) {
      case 'kotlin': return 'kotlin';
      case 'python': return 'python';
      case 'javascript': return 'javascript';
      case 'java': return 'java';
      case 'cpp': return 'cpp';
      case 'dart': return 'dart';
      case 'go': return 'go';
      case 'rust': return 'rust';
      case 'typescript': return 'typescript';
      case 'swift': return 'swift';
      case 'sql': return 'sql';
      case 'php': return 'php';
      case 'csharp': return 'cs';
      case 'ruby': return 'ruby';
      case 'bash':
      case 'linux': return 'bash';
      default: return 'plaintext';
    }
  }
}
