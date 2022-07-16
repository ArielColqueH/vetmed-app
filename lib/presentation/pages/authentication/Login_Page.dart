import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vetmed_app/provider/google_sign_in.dart';
import '../../../utils/main_utils.dart';
import '../../widgets/main_widgets.dart';
import '../authentication/widgets/auth_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found for that email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
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
              onPressed: () {
                Navigator.pop(context, false);
              },
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
            InputNormal(
              placeholder: 'Correo electrónico',
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 16,
            ),
            InputNormal(
              placeholder: 'Contraseñas',
              textEditingController: _passwordController,
              obscure: true,
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
              onPressed: () async {
                User? user = await loginUsingEmailPassword(
                    email: _emailController.text,
                    password: _passwordController.text,
                    context: context);
                if (user != null) {
                  Navigator.of(context).pushNamed('/HomePage');
                } else {
                  print("Error al ingresar al sistema");
                }
              },
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
                onPressed: () {
                  final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                  provider.googleLogin();
                  Navigator.of(context).pushNamed('/HomePage');
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
            TwoLinkText(
              normalText: '¿No tienes cuenta? ',
              linkText: 'Registrate por aqui',
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

