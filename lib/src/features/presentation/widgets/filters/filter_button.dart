import 'package:country_list_app/src/common_widgets.dart/icon_and_text_button.dart';
import 'package:country_list_app/src/features/presentation/widgets/filters/other_filters/other_filters.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconAndTextButton(
      onPressed: () {
        showModalBottomSheet(
              context: context,
              isScrollControlled: true, 
              builder: (context) {
                return const Wrap(children: [OtherFilters()]);
              });
      },
      label: 'Filter',
      icon: FontAwesomeIcons.filter,
    );
  }
}
