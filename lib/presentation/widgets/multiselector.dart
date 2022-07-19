import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vetmed_app/utils/colors.dart';

class Multiselector extends StatelessWidget {
  final String icon;
  final String buttonText;
  final String selectableGroup;
  final String selectableItem;
  final VoidCallback onPressed;

  const Multiselector(
      {Key? key,
      required this.icon,
      required this.buttonText,
      required this.onPressed,
      required this.selectableGroup,
      required this.selectableItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 24,
      ),
      onPressed: onPressed,
      color: selectableItem == selectableGroup? primaryColor : backgroundWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
        side: BorderSide(
          color: primaryColor,
          width: 2.0,
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: selectableItem == selectableGroup? primaryWhite : primaryColor,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            buttonText,
            style: TextStyle(color: selectableItem == selectableGroup? primaryWhite : primaryColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
