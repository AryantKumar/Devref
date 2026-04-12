import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // ── Dark Mode ──
  static const darkBackground = Color(0xFF0D1117);
  static const darkSurface = Color(0xFF161B22);
  static const darkCard = Color(0xFF21262D);
  static const darkBorder = Color(0xFF30363D);
  static const darkAccent = Color(0xFF58A6FF);
  static const darkTextPrimary = Color(0xFFE6EDF3);
  static const darkTextMuted = Color(0xFF8B949E);

  // ── Light Mode ──
  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFF6F8FA);
  static const lightCard = Color(0xFFFFFFFF);
  static const lightBorder = Color(0xFFD0D7DE);
  static const lightAccent = Color(0xFF0969DA);
  static const lightTextPrimary = Color(0xFF1F2328);
  static const lightTextMuted = Color(0xFF656D76);

  // ── Code Block (always dark) ──
  static const codeBackground = Color(0xFF0D1117);
  static const codeText = Color(0xFFE6EDF3);

  // ── Syntax Highlighting ──
  static const synKeyword = Color(0xFFFF7B72);
  static const synFunction = Color(0xFFD2A8FF);
  static const synString = Color(0xFFA5D6FF);
  static const synNumber = Color(0xFF79C0FF);
  static const synComment = Color(0xFF8B949E);
  static const synVariable = Color(0xFFFFA657);
  static const synType = Color(0xFF7EE787);

  // ── Difficulty Badge Colors ──
  static const diffVeryEasyBg = Color(0xFF238636);
  static const diffVeryEasyText = Color(0xFF7EE787);
  static const diffMediumBg = Color(0xFF1F6FEB);
  static const diffMediumText = Color(0xFF79C0FF);
  static const diffHardBg = Color(0xFF9E6A03);
  static const diffHardText = Color(0xFFE3B341);
  static const diffVeryHardBg = Color(0xFFDA3633);
  static const diffVeryHardText = Color(0xFFFF7B72);

  // ── Topic Accent Colors ──
  static const topicKotlin = Color(0xFF7F52FF);
  static const topicPython = Color(0xFF3572A5);
  static const topicJavaScript = Color(0xFFF1E05A);
  static const topicJava = Color(0xFFB07219);
  static const topicCpp = Color(0xFFF34B7D);
  static const topicDart = Color(0xFF00B4AB);
  static const topicGo = Color(0xFF00ADD8);
  static const topicRust = Color(0xFFDEA584);
  static const topicTypeScript = Color(0xFF3178C6);
  static const topicSwift = Color(0xFFF05138);
  static const topicDsa = Color(0xFF58A6FF);
  static const topicLinux = Color(0xFF89E051);
  static const topicSystemDesign = Color(0xFFE3B341);
  static const topicGit = Color(0xFFF1502F);
  static const topicSql = Color(0xFF336791);
  static const topicPhp = Color(0xFF777BB4);
  static const topicKmm = Color(0xFF7F52FF);
  static const topicReactNative = Color(0xFF61DAFB);
  static const topicCSharp = Color(0xFF178600);
  static const topicRuby = Color(0xFFCC342D);

  /// Get topic color from topicId
  static Color topicColor(String topicId) {
    switch (topicId) {
      case 'kotlin': return topicKotlin;
      case 'python': return topicPython;
      case 'javascript': return topicJavaScript;
      case 'java': return topicJava;
      case 'cpp': return topicCpp;
      case 'dart': return topicDart;
      case 'go': return topicGo;
      case 'rust': return topicRust;
      case 'typescript': return topicTypeScript;
      case 'swift': return topicSwift;
      case 'dsa': return topicDsa;
      case 'linux': return topicLinux;
      case 'system_design': return topicSystemDesign;
      case 'git': return topicGit;
      case 'sql': return topicSql;
      case 'php': return topicPhp;
      case 'kmm': return topicKmm;
      case 'react_native': return topicReactNative;
      case 'csharp': return topicCSharp;
      case 'ruby': return topicRuby;
      default: return darkAccent;
    }
  }

  /// Get difficulty badge colors
  static Color difficultyBg(String difficulty) {
    switch (difficulty) {
      case 'very_easy': return diffVeryEasyBg;
      case 'medium': return diffMediumBg;
      case 'hard': return diffHardBg;
      case 'very_hard': return diffVeryHardBg;
      default: return diffMediumBg;
    }
  }

  static Color difficultyText(String difficulty) {
    switch (difficulty) {
      case 'very_easy': return diffVeryEasyText;
      case 'medium': return diffMediumText;
      case 'hard': return diffHardText;
      case 'very_hard': return diffVeryHardText;
      default: return diffMediumText;
    }
  }

  static String difficultyLabel(String difficulty) {
    switch (difficulty) {
      case 'very_easy': return 'Very Easy';
      case 'medium': return 'Medium';
      case 'hard': return 'Hard';
      case 'very_hard': return 'Very Hard';
      default: return difficulty;
    }
  }
}
