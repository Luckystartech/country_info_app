import 'dart:developer';
import 'dart:io';
import 'package:country_info_app/src/features/presentation/controllers/country_controller.dart';
import 'package:country_info_app/src/features/presentation/screens/country_details.dart';
import 'package:country_info_app/src/features/presentation/widgets/country_list_tile.dart';
import 'package:country_info_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountrySearchResults extends ConsumerWidget {
  const CountrySearchResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countryListAsyncValue = ref.watch(countryControllerProvider);

    return countryListAsyncValue.when(
      data: (countries) {
        // log(countries.toString());
        return ListView.builder(
          itemCount: countries.entries.length,
          itemBuilder: (context, index) {
            if (countries.isEmpty) {
              return const Center(
                child: Text('opps!, No Country Found'),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                countries.entries.toList()[index].value.isNotEmpty
                    ? Text(
                        countries.keys.toList()[index],
                        style: context.textTheme.titleMedium!
                            .copyWith(color: context.colorScheme.primary),
                      )
                    : const SizedBox.shrink(),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: countries.entries.toList()[index].value.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, countriesIndex) {
                      return CountryListTile(
                        country: countries.entries
                            .toList()[index]
                            .value[countriesIndex],
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return CountryDetails(
                              country: countries.entries
                                  .toList()[index]
                                  .value[countriesIndex],
                            );
                          }));
                        },
                      );
                    }),
              ],
            );
          },
          // separatorBuilder: (context, index) {
          //   return gapH12;
          // },
        );
      },
      error: (e, st) {
        log(e.toString());
        if (e is SocketException) {
          return Center(
              child: Text(
            'Internet is Disconnected',
            style: context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold),
          ));
        } else {
          return Center(
              child: Text(
            'An Error Occured',
            style: context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold),
          ));
        }
      },
      loading: () => Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: context.colorScheme.primary,
        ),
      ),
    );
  }
}
