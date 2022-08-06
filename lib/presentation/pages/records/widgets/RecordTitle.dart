import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class RecordTitle extends StatelessWidget {
  final String text;

  const RecordTitle({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        '$text',
        style: TextStyle(
          fontSize: 15.0,
          color: primaryBlack,
          fontWeight: FontWeight.bold,
          height: 1.86,
        ),
      ),
    );
  }
}
