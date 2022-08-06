import 'package:flutter/material.dart';


class RecordSubtitle extends StatelessWidget {
  final String texto;
  final Color color;

  const RecordSubtitle({Key? key, required this.texto, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
        fontSize: 14.0,
        color: color,
        fontWeight: FontWeight.w500,
        height: 1.16,
      ),
    );
  }
}
