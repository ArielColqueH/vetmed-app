import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../utils/colors.dart';
import '../../widgets/main_widgets.dart';
import '../authentication/Login_Page.dart';
import '../home/widgets/home_widgets.dart';

class DoctorProfilePage extends StatelessWidget {
  const DoctorProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 405,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          ButtonBack(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.pop(context, false);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TitleText(
                            texto: 'Perfíl del doctor veterinario',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: Image.network(
                              fit: BoxFit.cover,
                              'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                              height: 100.0,
                              width: 100.0,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Luis Ortega Espinar",
                            style: TextStyle(
                              color: primaryBlack,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "Médico Veterinario General",
                            style: TextStyle(
                              color: primaryColor,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ClinicInfoCard(
                                iconCard: 'assets/icons/vetmed-calendar.svg',
                                numberCard: "5 años",
                                textCard: 'Experiencia',
                              ),
                              ClinicInfoCard(
                                iconCard: 'assets/icons/vetmed-pawn.svg',
                                numberCard: "54",
                                textCard: 'Atendidos',
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: primaryWhite,
                    width: size.width,
                    height: 520,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 24,
                          ),
                          TitleText(
                            texto: 'Bio',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SimpleText(
                            texto:
                                'Luis es médico veterinario graduado de la Universidad Mayor de San Andres. Atendió a todos tipo de mascotas durante los ultimos años.',
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          TitleText(
                            texto: 'Clínica donde trabaja',
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SimpleText(
                                texto: 'Clínica Angeles y Guardianes',
                              ),
                              ButtonIconText(
                                color: primaryColor,
                                text: 'Ir a clínica',
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/ClinicProfilePage');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Algo salio mal!'),
            );
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
