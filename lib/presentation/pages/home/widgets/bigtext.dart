import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';


class BigText extends StatelessWidget {
  final String texto;

  const BigText({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 28.0,
          color: primaryBlack,
          fontWeight: FontWeight.w600,
          height: 1.2857,
        ),
      ),
    );
  }
}