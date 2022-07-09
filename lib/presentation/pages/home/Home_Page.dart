import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetmed_app/presentation/components/bottomnav.dart';
import 'package:vetmed_app/presentation/pages/authentication/SignUp_Page.dart';
import 'package:vetmed_app/provider/google_sign_in.dart';

import '../../../utils/main_utils.dart';
import '../../widgets/main_widgets.dart';
import '../authentication/Login_Page.dart';
import '../home/widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final String? name = user?.displayName;
    final String? email = user?.email;
    final String? photoUrl = user?.photoURL;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 40,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  BigText(
                    texto: 'Bienvenido $name',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Subtitle(
                    texto:
                        'Cuidar y amar a nuestras mascotas es nuestra responsabilidad',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const TitleText(
                    texto: 'Clínicas veterinarias',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ClinicItem(
                    clinicStars: 4.5,
                    clinicLocation: 'Sopocachi',
                    clinicName: 'Clínica Angeles y Guardianes',
                    clinicPricing: 3,
                    clinicImage:
                        'https://images.unsplash.com/photo-1656326125836-b3422f35343a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                    clinicAttention: 200.0,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/ClinicProfilePage');
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const TitleText(
                    texto: 'Veterinarios Especialistas',
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      DoctorItem(
                        doctorImage:
                            'https://images.unsplash.com/photo-1656326125836-b3422f35343a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
                        doctorName: 'Pepito Perez',
                        onPressed: () {
                          Navigator.of(context).pushNamed('/DoctorProfilePage');
                        },
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final provider = Provider.of<GoogleSignInProvider>(
                          context,
                          listen: false);
                      provider.logout();
                    },
                    child: Text('logout'),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Algo salio mal!'),
            );
          } else {
            return LoginPage();
          }
        },
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
