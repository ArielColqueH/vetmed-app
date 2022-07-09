import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/colors.dart';
import '../../../widgets/icon-text.dart';

class ClinicInfoDollarCard extends StatelessWidget {
  final double clinicPricing;
  final String textCard;

  const ClinicInfoDollarCard(
      {Key? key,
      required this.clinicPricing,
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
              for (int i = 0; i < clinicPricing; i++)
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/vetmed-dollar.svg',
                      width: 10,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                  ],
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
