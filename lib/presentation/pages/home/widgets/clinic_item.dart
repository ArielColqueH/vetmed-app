import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/main_utils.dart';
import '../../../../presentation/widgets/main_widgets.dart';

class ClinicItem extends StatelessWidget {
  String clinicImage;
  String clinicName;
  String clinicLocation;
  double clinicAttention;
  double clinicStars;
  double clinicPricing;
  VoidCallback onPressed;

  ClinicItem({
    Key? key,
    required this.clinicImage,
    required this.clinicName,
    required this.clinicLocation,
    required this.clinicAttention,
    required this.clinicStars,
    required this.clinicPricing,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryWhite,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 20,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.network(
                    fit: BoxFit.cover,
                    '$clinicImage',
                    height: 64.0,
                    width: 64.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$clinicName',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: primaryBlack,
                    fontWeight: FontWeight.w500,
                    height: 1.4285,
                    letterSpacing: 0.1,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '$clinicLocation',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: terciaryColor,
                    fontWeight: FontWeight.w500,
                    height: 1.3333,
                    letterSpacing: 0.4,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    IconText(
                      icon_url: 'assets/icons/vetmed-pawn.svg',
                      texto: '$clinicAttention',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconText(
                      icon_url: 'assets/icons/vetmed-star.svg',
                      texto: '$clinicStars',
                    ),
                    const SizedBox(
                      width: 10,
                    ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
