import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/main_utils.dart';

class RecordCardItem extends StatelessWidget {
  final String recordName;
  final String lastRecordDate;
  final String recordIcon;
  final VoidCallback onPressed;

  RecordCardItem({
    Key? key,
    required this.recordName,
    required this.lastRecordDate,
    required this.recordIcon,
    required this.onPressed,
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
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      color: primaryColorLight,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                          'assets/icons/vetmed-${recordIcon}.svg'),
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
                    Text(
                      '$recordName',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: primaryBlack,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '$lastRecordDate',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: terciaryColor,
                        fontWeight: FontWeight.w500,
                        height: 1.2,
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
