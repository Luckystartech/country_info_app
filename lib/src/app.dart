import 'package:country_list_app/src/features/presentation/screens/country_list.dart';
import 'package:country_list_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/theme_mode_controller.dart';

/// The Widget that configures your application.
class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The provider listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    final themeMode = ref.watch(themeModeControllerProvider);
    final appThemeData = ref.watch(appThemeDataProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',
      onGenerateTitle: (BuildContext context) => 'Country List App',
      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // ThemeModeController to display the correct theme.
      themeMode: themeMode,
      theme: appThemeData.light,
      darkTheme: appThemeData.dark,
      // theme: ThemeData(),
      // darkTheme: ThemeData.dark(),

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      home: const CountryList(),
    );
  }
}
