import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:country_list_app/src/features/presentation/widgets/filters/filter_actions_widget.dart';
import 'package:country_list_app/src/features/presentation/widgets/filters/other_filters/continent_filter.dart';
import 'package:country_list_app/src/features/presentation/widgets/filters/other_filters/time_zone_filter.dart';
import 'package:country_list_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class OtherFilters extends StatelessWidget {
  const OtherFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: Sizes.p20, vertical: Sizes.p16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
               Text('Filter', style: context.textTheme.headlineSmall!.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold),),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon:  Icon(Icons.cancel, size: Sizes.p32, color: context.colorScheme.primary.withOpacity(0.3),),
              )
            ],
          ),
          const TimeZoneFilter(),
          gapH12,
          const ContinentFilter(),
          const FilterActionsWidget(),
          gapH24
        ],
      ),
    );
  }
}
