import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/main_utils.dart';
import '../../widgets/main_widgets.dart';
import '../authentication/widgets/auth_widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameTextController = TextEditingController();
  final _lastnameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
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
            InputNormal(
              placeholder: 'Nombre',
              textEditingController: _nameTextController,
            ),
            const SizedBox(
              height: 16,
            ),
            InputNormal(
              placeholder: 'Apellidos',
              textEditingController: _lastnameTextController,
            ),
            const SizedBox(
              height: 16,
            ),
            InputNormal(
              placeholder: 'Correo electrónico',
              textEditingController: _emailTextController,
            ),
            const SizedBox(
              height: 16,
            ),
            InputNormal(
              placeholder: 'Contraseñas',
              textEditingController: _passwordTextController,
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
              text: 'Empecemos',
              onPressed: () {
                _signUp();
                Navigator.of(context).pushNamed('/HomePage');
                _showActionSnackBar(context);
              },
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
            // const ButtonLogo(),
            const SizedBox(
              height: 32,
            ),
            TwoLinkText(
              normalText: '¿Ya tienes cuenta? ',
              linkText: 'Ingresa por aqui',
              onPressed: () {
                Navigator.of(context).pushNamed('/LoginPage');
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleSignUpError(FirebaseAuthException e) {
    String message;
    switch (e.code) {
      case 'email-already-in-use':
        message = "El email esta siendo usado";
        break;
      case 'invalid-email':
        message = "El email es invalido";
        break;
      default:
        message = "No se sabe que error es";
        break;
    }
    print(message);
  }

  Future _signUp() async {
    setState(() {
      loading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
      final user = FirebaseAuth.instance.currentUser;
      final String? uid = user?.uid;
      final docUser =
          FirebaseFirestore.instance.collection('PetOwner').doc(uid);
      final json = {
        'Email': _emailTextController.text,
        'Password': _passwordTextController.text,
        'Name': _nameTextController.text,
        'Lastname': _lastnameTextController.text,
      };
      docUser.set(json);
    } on FirebaseAuthException catch (e) {
      _handleSignUpError(e);
      setState(() {
        loading = false;
      });
    }
  }

  void _showActionSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: primaryColor,
      duration: const Duration(milliseconds: 3000),
      content: const Text(
        "Se creo tu cuenta con exito",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      action: SnackBarAction(
        textColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pushNamed('/MyPetsPage');
        },
        label: 'Ok',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
