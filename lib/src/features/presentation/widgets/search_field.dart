import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:country_list_app/src/features/presentation/controllers/country_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_list_app/src/theme/app_theme_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchField extends ConsumerWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryControllerNotifier =
        ref.read(countryControllerProvider.notifier);
    return TextField(
      style: context.textTheme.bodyLarge!.copyWith(
        color: context.colorScheme.primary,
      ),
      decoration:  InputDecoration(
          prefixIcon: const Icon(FontAwesomeIcons.search, size: Sizes.p24, ),
          
          label: Center(
            child: Text('Search Country', style: context.textTheme.titleLarge),
          )),
      onSubmitted: (query) async{
        await countryControllerNotifier.filterCountriesByName(query);
      },
    );
  }
}
