import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';



class ButtonWhatsapp extends StatelessWidget {
  final VoidCallback onPressed;

  const ButtonWhatsapp({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RawMaterialButton(
        onPressed: onPressed,
        constraints: const BoxConstraints(
          minWidth: 0,
        ),
        fillColor: whatsappColor,
        padding: const EdgeInsets.all(5.0),
        shape: const CircleBorder(),
        child: Icon(
          Icons.whatsapp,
          size: 25.0,
          color: primaryWhite,
        ),
      ),
    );
  }
}