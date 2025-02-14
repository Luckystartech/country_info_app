import 'package:country_list_app/src/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton(
      {super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.5;
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
          backgroundColor: const Color.fromRGBO(255, 108, 0, 1),
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(Sizes.p4)),
          fixedSize: Size(width, Sizes.p48)),
      child: Text(label),
    );
  }
}
