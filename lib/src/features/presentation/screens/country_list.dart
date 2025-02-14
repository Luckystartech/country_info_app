import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:country_list_app/src/features/presentation/widgets/country_search_results.dart';
import 'package:country_list_app/src/features/presentation/widgets/custom_app_bar.dart';
import 'package:country_list_app/src/features/presentation/widgets/filters/filter_button.dart';
import 'package:country_list_app/src/features/presentation/widgets/filters/language_filter_button.dart';
import 'package:country_list_app/src/features/presentation/widgets/search_field.dart';
import 'package:flutter/material.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.p20, vertical: Sizes.p20),
          child: Column(
            children: [
              SearchField(),
              gapH20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  LanguageFilterButton(),
                  FilterButton(),
                ],
              ),
              gapH16,
              Expanded(child: CountrySearchResults())
            ],
          ),
        ));
  }
}
