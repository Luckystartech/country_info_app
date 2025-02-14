import 'dart:developer';

import 'package:country_list_app/src/common_widgets.dart/app_filled_button.dart';
import 'package:country_list_app/src/common_widgets.dart/app_outlined_button.dart';
import 'package:country_list_app/src/constants/continents.dart';
import 'package:country_list_app/src/features/presentation/controllers/country_controller.dart';
import 'package:country_list_app/src/features/presentation/widgets/filters/filter_actions_widget.dart';
import 'package:country_list_app/src/features/presentation/widgets/filters/other_filters/time_zone_filter.dart';
import 'package:country_list_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// List<String> continentOption = ['Europe', 'America', 'Africa'];

final continentControllerProvider = StateProvider<Map<int, bool>>((ref) {
  return {};
});

final openFilterProvider = StateProvider<bool>((ref) {
  return false;
});

class ContinentFilter extends ConsumerWidget {
  const ContinentFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final continentOption = ref.watch(continentsOptionsProvider);
    final countryControllerNotifier =
        ref.read(countryControllerProvider.notifier);
    final currentOption = ref.watch(continentControllerProvider);
    final isOpen = ref.watch(openFilterProvider);
    final openFilterState = ref.read(openFilterProvider.notifier);
    final currentOptionNotifier =
        ref.read(continentControllerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text('Continent', style: context.textTheme.bodyLarge!.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),),
            IconButton(
              onPressed: () {
                openFilterState.state = !isOpen;
              },
              icon: Icon(isOpen
                  ? FontAwesomeIcons.angleUp
                  : FontAwesomeIcons.angleDown),
            )
          ],
        ),
        isOpen
            ? Column(
                children: List.generate(continentOption.length, (index) {
                  return CheckboxListTile.adaptive(
                    activeColor: context.colorScheme.primary,
                    checkColor: context.colorScheme.surface,
                    contentPadding: EdgeInsets.zero,
                    controlAffinity: ListTileControlAffinity.trailing,
                    title: Text(continentOption.toList()[index], style: context.textTheme.bodyLarge!.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: FontWeight.w300,
                      ),),
                    value: currentOption[index] ?? false,
                    onChanged: (value) {
                      //select language to filter by and pop immediately
                      if (value != null) {
                        currentOptionNotifier.state = {
                          ...currentOption,
                          index: value
                        };
                        log(continentOption.toList()[index]);
                        countryControllerNotifier.filterCountriesByContinent(
                            continentOption.toList()[index]);
                      }
                    },
                  );
                }),
              )
            : const SizedBox.shrink(),
       
      ],
    );
  }
}
