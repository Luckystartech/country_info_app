import 'package:country_info_app/src/common_widgets.dart/icon_and_text_button.dart';
import 'package:country_info_app/src/features/presentation/widgets/filters/select_language.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LanguageFilterButton extends StatelessWidget {
  const LanguageFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconAndTextButton(
        onPressed: () {
          // rgba(0, 15, 36, 1)
          //open modal for user to select language to filter by
          showBottomSheet(
              // backgroundColor: const Color.fromRGBO(0, 15, 36, 1),
              clipBehavior: Clip.hardEdge,
              elevation: 2,
              context: context,
              builder: (context) {
                return const SelectLanguage();
              });
        },
        label: 'EN',
        icon: FontAwesomeIcons.globe);
  }
}
