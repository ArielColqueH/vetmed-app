import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vetmed_app/provider/google_sign_in.dart';
import '../../../utils/main_utils.dart';
import '../../widgets/main_widgets.dart';
import '../authentication/widgets/auth_widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Column(
          children: [
            ButtonBack(
              color: secondaryColor,
            ),
            const SizedBox(
              height: 16,
            ),
            const TitleText(
              texto: 'Ingresar',
            ),
            const SizedBox(
              height: 8,
            ),
            const Subtitle(
              texto: 'Ingresa tus datos para ingresar a tus sistema',
            ),
            const SizedBox(
              height: 16,
            ),
            const SizedBox(
              height: 16,
            ),
            const InputNormal(
              placeholder: 'Correo electrónico',
            ),
            const SizedBox(
              height: 16,
            ),
            const InputNormal(
              placeholder: 'Contraseñas',
            ),
            const SizedBox(
              height: 8,
            ),
            const SizedBox(
              height: 32,
            ),
            ButtonNormal(
              color: primaryColor,
              text: 'Ingresar',
              routePage: 'HomePage',
            ),
            const SizedBox(
              height: 32,
            ),
            const DividerDetail(
              texto: 'Ingresa con Google',
            ),
            const SizedBox(
              height: 16,
            ),
            Align(
              alignment: Alignment.center,
              child: RawMaterialButton(
                fillColor: Colors.white,
                onPressed: (){
                  final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                },
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
            ),
            const SizedBox(
              height: 32,
            ),
            const TwoLinkText(
              normalText: '¿No tienes cuenta? ',
              linkText: 'Registrate por aqui',
            ),
          ],
        ),
      ),
    );
  }
}

void signInWithGoogle() {

}
