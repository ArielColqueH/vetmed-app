import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';

class ReservationCard extends StatelessWidget {
  final String reservationStatus;

  const ReservationCard({Key? key, required this.reservationStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: primaryWhite,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 18.0,
              color: primaryColor,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '$reservationStatus',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0
              ),
            ),
          ],
        ),
      ),
    );
  }
}
