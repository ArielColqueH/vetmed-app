import 'package:flutter/material.dart';
import '../../../utils/main_utils.dart';
import '../../widgets/main_widgets.dart';
import '../authentication/widgets/auth_widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
              texto: 'Crear cuenta',
            ),
            const SizedBox(
              height: 8,
            ),
            const Subtitle(
              texto: 'Ingresa tus datos para crearte una cuenta',
            ),
            const SizedBox(
              height: 16,
            ),
            const InputNormal(
              placeholder: 'Nombre',
            ),
            const SizedBox(
              height: 16,
            ),
            const InputNormal(
              placeholder: 'Apellidos',
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
              text: 'Empecemos',
              routePage: 'HomePage',
            ),
            const SizedBox(
              height: 32,
            ),
            const DividerDetail(
              texto: 'Crea tu cuenta con Google',
            ),
            const SizedBox(
              height: 16,
            ),
            const ButtonLogo(),
            const SizedBox(
              height: 32,
            ),
            const TwoLinkText(
              normalText: '¿Ya tienes cuenta? ',
              linkText: 'Ingresa por aqui',
            ),
          ],
        ),
      ),
    );
  }
}
