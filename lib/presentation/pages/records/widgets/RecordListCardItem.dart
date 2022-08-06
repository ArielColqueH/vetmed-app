import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/main_utils.dart';

class RecordListCardItem extends StatelessWidget {
  final String recordDetailName;
  final String lastRecordDate;
  final VoidCallback onPressed;

  RecordListCardItem({
    Key? key,
    required this.recordDetailName,
    required this.lastRecordDate,
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ver detalle',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '$recordDetailName',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: secondaryColor,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),Text(
                          '$lastRecordDate',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: secondaryColor,
                            fontWeight: FontWeight.w500,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 11,
              ),
              Column(
                children: [
                  Container(
                    width: 29,
                    height: 29,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: primaryWhite,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
