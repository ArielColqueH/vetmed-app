import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class TwoLinkText extends StatelessWidget {
  final String normalText;
  final String linkText;
  final VoidCallback onPressed;

  const TwoLinkText(
      {Key? key,
      required this.normalText,
      required this.linkText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalText,
          style: TextStyle(
            fontSize: 16.0,
            color: primaryBlack,
            fontWeight: FontWeight.w400,
            height: 1.2727,
          ),
        ),
        GestureDetector(
          onTap: onPressed,
          child: Text(
            linkText,
            style: TextStyle(
              fontSize: 16.0,
              color: primaryColor,
              fontWeight: FontWeight.w400,
              height: 1.2727,
            ),
          ),
        ),
      ],
    );
  }
}
