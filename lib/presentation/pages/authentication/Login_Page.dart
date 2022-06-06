import 'package:flutter/material.dart';
import 'package:vetmed_app/utils/colors.dart';

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
            Text(
              "Una app para ti y tu mascota",
              style: TextStyle(
                  color: primaryBlack,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Ingresar"),
                style: raisedButtonStyle,
              ),
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
