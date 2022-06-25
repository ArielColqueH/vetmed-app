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

class SingUpPage extends StatelessWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textController = TextEditingController();
    return Scaffold(
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
              height: 24,
            ),
            const TitleScreen(
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
              height: 48,
            ),
            ButtonNormal(
              color: primaryColor,
              text: 'Empecemos',
            ),
            const SizedBox(
              height: 48,
            ),
            const DividerDetail(
              texto: 'Crea tu cuenta con Google',
            ),
            const SizedBox(
              height: 16,
            ),
            const ButtonLogo(),
          ],
        ),
      ),
    );
  }
}
