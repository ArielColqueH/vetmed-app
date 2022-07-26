import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ButtonDelete extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const ButtonDelete({Key? key, required this.color, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RawMaterialButton(
        onPressed: onPressed,
        constraints: const BoxConstraints(
          minWidth: 0,
        ),
        fillColor: color,
        padding: const EdgeInsets.all(10.0),
        shape: const CircleBorder(),
        child: Icon(
          Icons.delete,
          size: 20.0,
          color: color == primaryWhite ? Colors.red : primaryWhite,
        ),
      ),
    );
  }
}
