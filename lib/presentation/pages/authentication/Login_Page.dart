import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/pages/authentication/widgets/button-logo.dart';
import 'package:vetmed_app/presentation/pages/authentication/widgets/divider-detail.dart';
import 'package:vetmed_app/presentation/widgets/button-back.dart';
import 'package:vetmed_app/utils/colors.dart';
import '../../../utils/colors.dart';
import '../../widgets/button-normal.dart';
import '../../widgets/input-normal.dart';
import '../../widgets/subtitle.dart';
import '../../widgets/title.dart';
import '../../widgets/two-link-text.dart';

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
            const TitleScreen(
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
            const ButtonLogo(),
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
