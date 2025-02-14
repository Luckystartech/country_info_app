import 'package:country_info_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton(
      {super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.3;
    final colorScheme = Theme.of(context).colorScheme;
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: colorScheme.primary, width: 2),
              borderRadius: BorderRadius.circular(Sizes.p4)),
          fixedSize: Size(width, Sizes.custom(50))),
      child: Text(label),
    );
  }
}
