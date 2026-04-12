import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Represents the persistent state of the theme.
class AppThemeState {
  final ThemeMode mode;
  final bool isManualOverride;

  AppThemeState({required this.mode, this.isManualOverride = false});
}

class ThemeNotifier extends Notifier<AppThemeState> {
  static const _themePrefKey = 'theme_preference';
  static const _manualOverrideKey = 'theme_manual_override';

  @override
  AppThemeState build() {
    // Return a default state while we load asynchronously.
    // The UI will initially use system theme until loaded.
    _loadFromPrefs();
    return AppThemeState(mode: ThemeMode.system, isManualOverride: false);
  }

  Future<void> _loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final isOverride = prefs.getBool(_manualOverrideKey) ?? false;
    
    if (isOverride) {
      final isDark = prefs.getBool(_themePrefKey) ?? true;
      state = AppThemeState(
        mode: isDark ? ThemeMode.dark : ThemeMode.light,
        isManualOverride: true,
      );
    }
    // If not overridden, we naturally stay in ThemeMode.system.
  }

  Future<void> toggleTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    
    // Once the user touches the toggle, we enter manual override.
    await prefs.setBool(_manualOverrideKey, true);
    await prefs.setBool(_themePrefKey, isDark);

    state = AppThemeState(
      mode: isDark ? ThemeMode.dark : ThemeMode.light,
      isManualOverride: true,
    );
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, AppThemeState>(() {
  return ThemeNotifier();
});
