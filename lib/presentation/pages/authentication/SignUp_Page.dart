import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/widgets/atoms/button-back.dart';
import 'package:vetmed_app/utils/colors.dart';
import '../../../utils/colors.dart';
import '../../widgets/atoms/button-normal.dart';
import '../../widgets/atoms/input-normal.dart';
import '../../widgets/atoms/subtitle.dart';
import '../../widgets/atoms/title.dart';

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
            ButtonBack(color: secondaryColor,),
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
          ],
        ),
      ),
    );
  }
}
