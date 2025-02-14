import 'dart:developer';

import 'package:country_list_app/src/constants/time_zones.dart';
import 'package:country_list_app/src/features/presentation/controllers/country_controller.dart';
import 'package:country_list_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// List<String> timeZoneOptions = ['Bahasa', 'Detch'];

final timeZoneControllerProvider = StateProvider<Map<int, bool>>((ref) {

  return {};
});

final openFilterProvider = StateProvider<bool>((ref) {
  return false;
});

class TimeZoneFilter extends ConsumerWidget {
  const TimeZoneFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timeZoneOptions = ref.watch(timeZonesProvider);
    final currentOption = ref.watch(timeZoneControllerProvider);
    final isOpen = ref.watch(openFilterProvider);
    final openFilterState = ref.read(openFilterProvider.notifier);
    final currentOptionNotifier = ref.read(timeZoneControllerProvider.notifier);
    final countryControllerNotifier =
        ref.read(countryControllerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text('Time Zone', style: context.textTheme.bodyLarge!.copyWith(
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
            ? SingleChildScrollView(
              child: Column(
                  children: List.generate(timeZoneOptions.length, (index) {
                    return CheckboxListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      controlAffinity: ListTileControlAffinity.trailing,
                      title: Text(timeZoneOptions.toList()[index], style: context.textTheme.bodyLarge!.copyWith(
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
                          log(timeZoneOptions.toList()[index]);
                        countryControllerNotifier.filterCountriesByTimeZones(
                            timeZoneOptions.toList()[index]);
                        }
                      },
                    );
                  }),
                ),
            )
            : const SizedBox.shrink(),
        
      ],
    );
  }
}
