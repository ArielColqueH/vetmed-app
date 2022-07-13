import 'package:flutter/material.dart';
import '../../../../utils/main_utils.dart';

class DoctorItem extends StatelessWidget {
  String doctorImage;
  String doctorName;
  VoidCallback onPressed;

  DoctorItem({
    Key? key,
    required this.doctorImage,
    required this.doctorName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 20.0,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                fit: BoxFit.cover,
                '$doctorImage',
                height: 120.0,
                width: 120.0,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              '$doctorName',
              style: TextStyle(
                fontSize: 14.0,
                color: primaryBlack,
                fontWeight: FontWeight.w500,
                height: 1.4285,
                letterSpacing: 0.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
