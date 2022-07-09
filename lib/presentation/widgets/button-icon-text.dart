import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ButtonIconText extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const ButtonIconText({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_forward_outlined),
      label: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.0,
        ),
      ),
      style: ElevatedButton.styleFrom(
        onPrimary: primaryWhite,
        primary: color,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
      ),
    );
  }
}
