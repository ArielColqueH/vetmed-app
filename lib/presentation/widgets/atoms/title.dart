import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

class TitleScreen extends StatelessWidget {
  final String texto;

  const TitleScreen({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        texto,
        style: TextStyle(
          fontSize: 22.0,
          color: primaryBlack,
          fontWeight: FontWeight.w700,
          height: 1.2727,
        ),
      ),
    );
  }
}
