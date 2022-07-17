import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/main_utils.dart';

class IconText extends StatelessWidget {
  final String icon_url;
  final String texto;


  const IconText({Key? key, required this.icon_url, required this.texto,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            '$icon_url',
            width: 16,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '$texto',
            style: TextStyle(
              fontSize: 12.0,
              color: primaryColor,
              fontWeight: FontWeight.w400,
              height: 1.3333,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
