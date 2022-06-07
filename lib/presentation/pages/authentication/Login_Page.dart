import 'package:flutter/material.dart';
import 'package:vetmed_app/utils/colors.dart';
import '../../../utils/colors.dart';
import '../../widgets/atoms/button-normal.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                "assets/images/img-veterinary-pet.png",
              ),
            ),
            Text(
              "VETMED",
              style: TextStyle(
                  color: primaryBlack,
                  fontSize: 64.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Una app para ti y tu mascota",
              style: TextStyle(
                  color: primaryBlack,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 48,
            ),
            ButtonNormal(
              color: primaryColor, text: 'Ingresar',
            ),
            SizedBox(
              height: 24,
            ),
            ButtonNormal(
              color: secondaryColor, text: 'Crear cuenta',
            ),
          ],
        ),
      ),
    );
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: primaryWhite,
  primary: primaryColor,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(100)),
  ),
);