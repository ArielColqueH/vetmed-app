import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../utils/colors.dart';

class ButtonLogo extends StatelessWidget {
  final VoidCallback callback;
  const ButtonLogo({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RawMaterialButton(
        fillColor: Colors.white,
        onPressed: callback,
        elevation: 2.0,
        constraints: const BoxConstraints(
          minWidth: 0,
        ),
        padding: const EdgeInsets.all(15.0),
        shape: const CircleBorder(),
        child: SvgPicture.asset(
          'assets/images/img-google.svg',
          height: 20.0,
          width: 20.0,
        ),
      ),
    );
  }
}
