import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SimpleText extends StatelessWidget {
  final String texto;

  const SimpleText({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 14.0,
          color: terciaryColor,
          fontWeight: FontWeight.normal,
          height: 1.4285,
        ),
      ),
    );
  }
}
