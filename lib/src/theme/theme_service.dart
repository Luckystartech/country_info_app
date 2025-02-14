import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class ThemeModeService {
  ThemeMode _themeMode = ThemeMode.light;

  SharedPreferences? prefs;

  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> initthemeMode() async {
    prefs = await SharedPreferences.getInstance();
    int theme = prefs?.getInt("theme") ?? _themeMode.index;
    _themeMode = ThemeMode.values[theme];
    return _themeMode;
  }

  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode mode) async {
    // Use the shared_preferences package to persist settings locally 
    _themeMode = mode;
    prefs?.setInt("theme", mode.index);
  }
}

final themeModeServiceProvider = Provider<ThemeModeService>((ref) {
  return ThemeModeService();
});
