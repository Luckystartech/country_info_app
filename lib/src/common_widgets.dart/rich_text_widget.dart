import 'package:country_info_app/src/constants/app_sizes.dart';
import 'package:country_info_app/src/theme/app_theme_data.dart';
import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Sizes.custom(2)),
      child: RichText(
        text: TextSpan(
            text: '$title: ',
            style: context.textTheme.bodyLarge!.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: value,
                  style: context.textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w100)),
            ]),
      ),
    );
  }
}
