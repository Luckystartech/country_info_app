import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_service.dart';

/// A class that many Widgets can interact with to read user settings, update
/// user settings, or listen to user settings changes.
///
/// Controllers glue Data Services to Flutter Widgets. The ThemeModeController
/// uses the ThemeModeService to store and retrieve user theme settings.
class ThemeModeController extends StateNotifier<ThemeMode> {
  ThemeModeController(this._themeModeService) : super(ThemeMode.system) {
    init();
  }

  // Make ThemeModeService a private variable so it is not used directly.
  final ThemeModeService _themeModeService;

  /// Load the user's theme settings from the themeModeService. It loads from a
  /// local database. The controller only knows it can load the
  /// settings from the service.
  Future<void> init() async {
    final themeMode = await _themeModeService.initthemeMode();

    // Important! Inform listeners a change has occurred.
    state = themeMode;
  }

  /// Update and persist the ThemeMode based on the user's selection.
  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;

    // update the themeMode from the ThemeModeService
    await _themeModeService.updateThemeMode(newThemeMode);
    // Important! Inform listeners a change has occurred.
    state = newThemeMode;
  }
}

final themeModeControllerProvider =
    StateNotifierProvider<ThemeModeController, ThemeMode>((ref) {
  final themeModeService = ref.watch(themeModeServiceProvider);
  return ThemeModeController(themeModeService);
});
