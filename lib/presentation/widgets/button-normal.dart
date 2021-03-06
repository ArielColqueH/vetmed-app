import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class ButtonNormal extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  const ButtonNormal({
    Key? key,
    required this.color,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
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
      ),
    );
  }
}
