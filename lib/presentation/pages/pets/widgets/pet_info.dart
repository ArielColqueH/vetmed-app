import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/icon-text.dart';

class ClinicInfoCard extends StatelessWidget {
  final String titleCardPet;
  final String textCardPet;

  const ClinicInfoCard({
    Key? key,
    required this.titleCardPet,
    required this.textCardPet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
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
          Text(
            '$titleCardPet',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0, color: primaryColor),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            '$textCardPet',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
