import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class SpecialtyOption extends StatelessWidget {
  final String optionName;

  const SpecialtyOption({Key? key, required this.optionName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 8.0,
        top: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: primaryColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 16,
      ),
      child: Text(
        '$optionName',
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 14.0, color: primaryWhite),
      ),
    );
  }
}
