import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/main_utils.dart';
import '../../widgets/main_widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
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
              color: primaryColor,
              text: 'Ingresar',
              onPressed: () {
                Navigator.of(context).pushNamed('/LoginPage');
              },
            ),
            SizedBox(
              height: 24,
            ),
            ButtonNormal(
              color: secondaryColor,
              text: 'Crear cuenta',
              onPressed: () {
                Navigator.of(context).pushNamed('/SignUpPage');
              },
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
