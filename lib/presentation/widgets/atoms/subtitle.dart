import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class Subtitle extends StatelessWidget {
  final String texto;

  const Subtitle({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 14.0,
          color: terciaryColor,
          fontWeight: FontWeight.w500,
          height: 1.4285,
        ),
      ),
    );
  }
}
