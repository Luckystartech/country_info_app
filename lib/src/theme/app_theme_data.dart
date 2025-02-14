import 'dart:developer';

import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:country_list_app/src/theme/theme_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppThemeData {
  ThemeData get light => _lightTheme();
  ThemeData get dark => _darkTheme();
  // rgba(0, 0, 0, 1) //primary Color
  // rgba(28, 25, 23, 1) //

  ColorScheme get _lightModeColorScheme =>
      ThemeData.light().colorScheme.copyWith(
          surface: const Color.fromRGBO(255, 255, 255, 1),
          primary: const Color.fromRGBO(0, 15, 36, 1),
          secondary: const Color.fromRGBO(242, 244, 247, 1));
  // rgba(0, 15, 36, 1)
  ColorScheme get _darkModeColorScheme =>
      ThemeData.light().colorScheme.copyWith(
            surface: const Color.fromRGBO(0, 15, 36, 1),
            primary: const Color.fromRGBO(255, 255, 255, 1),
            secondary: const Color.fromRGBO(152, 162, 179, 0.2),
          );

  final _fontFamily = 'Axiforma';

  TextTheme get _commontextTheme => _commonTheme.textTheme;

  ThemeData get _commonTheme => ThemeData().copyWith(
        textTheme: const TextTheme().copyWith(
          bodySmall: TextStyle(fontFamily: _fontFamily),
          bodyMedium: TextStyle(fontFamily: _fontFamily),
          bodyLarge: TextStyle(fontFamily: _fontFamily),
          displaySmall: TextStyle(fontFamily: _fontFamily),
          displayMedium: TextStyle(fontFamily: _fontFamily),
          displayLarge: TextStyle(fontFamily: _fontFamily),
          headlineLarge: TextStyle(fontFamily: _fontFamily),
          headlineMedium: TextStyle(fontFamily: _fontFamily),
          headlineSmall: TextStyle(fontFamily: _fontFamily),
          titleLarge: TextStyle(
              fontFamily: _fontFamily,
              fontWeight: FontWeight.w100,
              fontSize: Sizes.p20),
          titleMedium: TextStyle(
            fontFamily: _fontFamily,
            fontWeight: FontWeight.w200,
            fontSize: Sizes.p16,
          ),
          titleSmall: TextStyle(fontFamily: _fontFamily),
          labelLarge: TextStyle(fontFamily: _fontFamily),
          labelSmall: TextStyle(fontFamily: _fontFamily),
          labelMedium: TextStyle(fontFamily: _fontFamily),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  vertical: Sizes.p12, horizontal: Sizes.p16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.p12),
              )),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            border: OutlineInputBorder(borderSide: BorderSide.none),
            floatingLabelBehavior: FloatingLabelBehavior.never),
        checkboxTheme: CheckboxThemeData(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
      );
//Light theme
  ThemeData _lightTheme() => ThemeData.light().copyWith(
      textTheme: _commontextTheme.copyWith(
        titleLarge: _commontextTheme.titleLarge!
            .copyWith(color: _lightModeColorScheme.primary),
        titleMedium: _commontextTheme.titleMedium!
            .copyWith(color: _lightModeColorScheme.primary),
      ),
      scaffoldBackgroundColor: _lightModeColorScheme.surface,
      colorScheme: _lightModeColorScheme,
      outlinedButtonTheme: _commonTheme.outlinedButtonTheme,
      inputDecorationTheme: _commonTheme.inputDecorationTheme.copyWith(
        fillColor: _lightModeColorScheme.secondary,
        prefixIconColor: _lightModeColorScheme.primary.withOpacity(0.4),
      ),
      bottomSheetTheme: const BottomSheetThemeData()
          .copyWith(backgroundColor: _lightModeColorScheme.secondary),
      checkboxTheme: _commonTheme.checkboxTheme,
      iconTheme: _commonTheme.iconTheme,
      appBarTheme: AppBarTheme(foregroundColor: _lightModeColorScheme.primary));

      //dark Theme 
  ThemeData _darkTheme() => ThemeData.dark().copyWith(
        textTheme: _commontextTheme.copyWith(
          titleLarge: _commontextTheme.titleLarge!
              .copyWith(color: _darkModeColorScheme.primary),
          titleMedium: _commontextTheme.titleMedium!
              .copyWith(color: _darkModeColorScheme.primary),
        ),
        scaffoldBackgroundColor: _darkModeColorScheme.surface,
        colorScheme: _darkModeColorScheme,
        outlinedButtonTheme: _commonTheme.outlinedButtonTheme,
        inputDecorationTheme: _commonTheme.inputDecorationTheme.copyWith(
            fillColor: _darkModeColorScheme.secondary,
            prefixIconColor: _darkModeColorScheme.primary.withOpacity(0.7)),
        bottomSheetTheme: const BottomSheetThemeData()
            .copyWith(backgroundColor: _darkModeColorScheme.surface),
        checkboxTheme: _commonTheme.checkboxTheme,
        iconTheme: _commonTheme.iconTheme,
        appBarTheme: AppBarTheme(
          foregroundColor: _darkModeColorScheme.primary
        ),
        
      );
}

final appThemeDataProvider = Provider<AppThemeData>((ref) {
  // log('AppThemeData instance created');
  return AppThemeData();
});

final appLogoProvider = Provider<String>((ref) {
  final themeMode = ref.watch(themeModeControllerProvider);
  if (themeMode == ThemeMode.dark) {
    return 'assets/images/logo.png';
  } else {
    return 'assets/images/ex_logo.png';
  }
});

extension AppBuildContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}
