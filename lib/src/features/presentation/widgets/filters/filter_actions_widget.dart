import 'package:country_info_app/src/common_widgets.dart/app_filled_button.dart';
import 'package:country_info_app/src/common_widgets.dart/app_outlined_button.dart';
import 'package:country_info_app/src/features/presentation/controllers/country_controller.dart';
import 'package:country_info_app/src/features/presentation/widgets/filters/other_filters/continent_filter.dart';
import 'package:country_info_app/src/features/presentation/widgets/filters/other_filters/time_zone_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterActionsWidget extends StatelessWidget {
  const FilterActionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final timeZoneNotifier = ref.watch(timeZoneControllerProvider);
      final continentControllerNotifier =
          ref.watch(continentControllerProvider);
      final countryControllerNotifier =
          ref.read(countryControllerProvider.notifier);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppOutlinedButton(
              onPressed: () {
                timeZoneNotifier.clear();
                continentControllerNotifier.clear();
                countryControllerNotifier.fetchAllCountriesByAphabets();
                Navigator.of(context).pop();
              },
              label: 'Reset'),
          AppFilledButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              label: 'Show results'),
        ],
      );
    });
  }
}
