import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:country_list_app/src/features/domain/country.dart';
import 'package:country_list_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class CountryListTile extends StatelessWidget {
  const CountryListTile(
      {super.key, required this.country, required this.onTap});

  final VoidCallback onTap;
  final Country country;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        clipBehavior: Clip.hardEdge,
        width: Sizes.p48,
        height: Sizes.p48,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.p8)),
        child: Image.network(country.flag.pngUrl, fit: BoxFit.cover,),
      ),
      title: Text(country.name, style: context.textTheme.bodyLarge!.copyWith(
        fontWeight: FontWeight.w400,
        color: context.colorScheme.primary
      ),),
      subtitle: Text(country.capital, style: context.textTheme.bodySmall!.copyWith(
        fontWeight: FontWeight.w100,
        color: context.colorScheme.primary
      ),),
    );
  }
}
