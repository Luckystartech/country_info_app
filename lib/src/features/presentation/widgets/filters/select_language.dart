import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:country_list_app/src/constants/languages.dart';
import 'package:country_list_app/src/features/presentation/controllers/country_controller.dart';
import 'package:country_list_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final langControllerProvider = StateProvider<String>((ref) {
  final languageOptions = ref.watch(languagesOptionsProvider);
  return languageOptions.first;
});

class SelectLanguage extends ConsumerWidget {
  const SelectLanguage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageOptions = ref.watch(languagesOptionsProvider);
    final currentOption = ref.watch(langControllerProvider);
    final currentOptionNotifier = ref.read(langControllerProvider.notifier);
    final countryControllerNotifier =
        ref.read(countryControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p24, vertical: Sizes.p16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Languages',
                style: context.textTheme.headlineSmall!.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon:  Icon(Icons.cancel, size: Sizes.p32, color: context.colorScheme.primary.withOpacity(0.3),),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: false,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: languageOptions.length,
                itemBuilder: (context, index) {
                  return RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(
                      languageOptions.toList()[index],
                      style: context.textTheme.bodyLarge!.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    value: languageOptions.toList()[index],
                    groupValue: currentOption,
                    onChanged: (language) {
                      //select language to filter by and pop immediately
                      currentOptionNotifier.state = language.toString();

                      if (language == null) return;
                      if (language == 'None') {
                        countryControllerNotifier.fetchAllCountriesByAphabets();
                        Navigator.of(context).pop();
                        return;
                      }
                      countryControllerNotifier
                          .filterCountriesByLanguages(language);
                      Navigator.of(context).pop();
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
