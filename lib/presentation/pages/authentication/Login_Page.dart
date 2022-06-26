import 'package:flutter/material.dart';
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
