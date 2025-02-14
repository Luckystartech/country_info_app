import 'package:country_info_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme_mode_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the ThemeModeController is updated and
/// Widgets that listen to the ThemeModeController are rebuilt.
class ToggleThemeIcon extends ConsumerWidget {
  const ToggleThemeIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeControllerProvider);
    final themeModeControllerNotifier =
        ref.read(themeModeControllerProvider.notifier);
    return IconButton(
        onPressed: () {
          switch (themeMode) {
            case ThemeMode.dark:
              themeModeControllerNotifier.updateThemeMode(ThemeMode.light);
              break;
            case ThemeMode.light:
              themeModeControllerNotifier.updateThemeMode(ThemeMode.dark);
              break;
            default:
              themeModeControllerNotifier.updateThemeMode(ThemeMode.system);
          }
        },
        icon: Icon(
          themeMode == ThemeMode.light
              ? Icons.light_mode_outlined
              : Icons.dark_mode_outlined,
          size: Sizes.p32,
        ));
  }
}
