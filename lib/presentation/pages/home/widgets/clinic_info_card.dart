import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/icon-text.dart';

class ClinicInfoCard extends StatelessWidget {
  final String iconCard;
  final String numberCard;
  final String textCard;

  const ClinicInfoCard(
      {Key? key,
      required this.iconCard,
      required this.numberCard,
      required this.textCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: primaryWhite,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconText(
                icon_url: '$iconCard',
                texto: '$numberCard',
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            '$textCard',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
