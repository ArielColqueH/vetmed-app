import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/main_utils.dart';

class RecordListCardItem extends StatelessWidget {
  final String doctorName;
  final String registeredCode;
  final String imageDoctor;

  RecordListCardItem({
    Key? key,
    required this.doctorName,
    required this.registeredCode,
    required this.imageDoctor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
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
                    '$imageDoctor',
                    height: 64.0,
                    width: 64.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$doctorName',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: primaryBlack,
                      fontWeight: FontWeight.bold,
                      height: 1.4285,
                      letterSpacing: 0.1,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '$registeredCode',
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
    );
  }
}
