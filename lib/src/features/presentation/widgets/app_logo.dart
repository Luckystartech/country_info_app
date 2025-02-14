import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:country_list_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppLogo extends ConsumerWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logo = ref.watch(appLogoProvider);
    return Image.asset(logo, fit: BoxFit.cover, width: Sizes.custom(100),);
  }
}
