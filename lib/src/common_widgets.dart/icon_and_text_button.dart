import 'package:flutter/material.dart';

class IconAndTextButton extends StatelessWidget {
  const IconAndTextButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
  });

  final VoidCallback onPressed;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      label: Text(label),
      icon: Icon(icon),
    );
  }
}
