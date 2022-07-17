
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/main_utils.dart';

class PetCardItem extends StatelessWidget {
  final String petName;
  final String petBreed;
  final String petLifetime;
  final String petSex;
  final String petPhoto;
  final VoidCallback onPressed;

  PetCardItem({
    Key? key,
    required this.petName,
    required this.petBreed,
    required this.petLifetime,
    required this.petSex,
    required this.onPressed,
    required this.petPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
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
                      '$petPhoto',
                      height: 64.0,
                      width: 64.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$petName',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: primaryBlack,
                            fontWeight: FontWeight.w500,
                            height: 1.4285,
                            letterSpacing: 0.1,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/icons/vetmed-male.svg',
                          width: 18,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      '$petBreed',
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
                    Text(
                      '$petLifetime',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: primaryColor,
                        fontWeight: FontWeight.w500,
                        height: 1.3333,
                        letterSpacing: 0.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
