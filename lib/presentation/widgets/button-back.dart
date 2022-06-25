import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ButtonBack extends StatelessWidget {
  final Color color;

  const ButtonBack({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RawMaterialButton(
        onPressed: () {},
        constraints: const BoxConstraints(
          minWidth: 0,
        ),
        fillColor: color,
        padding: const EdgeInsets.all(10.0),
        shape: const CircleBorder(),
        child: Icon(
          Icons.arrow_back_ios_sharp,
          size: 20.0,
          color: primaryWhite,
        ),
      ),
    );
  }
}
