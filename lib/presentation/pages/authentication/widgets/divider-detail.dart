import 'package:flutter/material.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/two-link-text.dart';

class DividerDetail extends StatelessWidget {
  final String texto;

  const DividerDetail({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(right: 20.0, left: 20),
          child: Divider(
            color: primaryBlack,
            thickness: 1,
          ),
        ),
      ),
      Text(
        texto,
        style: TextStyle(
          fontSize: 14.0,
          color: terciaryColor,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
      ),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 20.0, right: 20),
          child: Divider(
            color: primaryBlack,
            thickness: 1,
          ),
        ),
      ),

    ]);
  }
}
