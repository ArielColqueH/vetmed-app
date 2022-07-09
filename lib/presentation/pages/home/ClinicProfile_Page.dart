import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vetmed_app/utils/colors.dart';
import '../../widgets/main_widgets.dart';
import '../authentication/Login_Page.dart';
import '../home/widgets/home_widgets.dart';

class ClinicProfilePage extends StatelessWidget {
  const ClinicProfilePage({Key? key}) : super(key: key);

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
            return Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1629909613654-28e377c37b09?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1468&q=80'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    child: Container(
                      width: size.width,
                      height: 220,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            const TitleText(
                              texto: 'Clínica Angeles y Guardianes',
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                ReservationCard(
                                  reservationStatus:
                                      "Atención solo con reservas",
                                ),
                                Container(
                                  height: 30.0,
                                  width: 1.0,
                                  color: primaryColor,
                                  margin: const EdgeInsets.only(
                                      left: 25.0, right: 15.0),
                                ),
                                ButtonWhatsapp(
                                  onPressed: () {
                                    print('whatsapp');
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClinicInfoCard(
                                  iconCard: 'assets/icons/vetmed-pawn.svg',
                                  numberCard: "100",
                                  textCard: 'Clientes',
                                ),
                                ClinicInfoCard(
                                  iconCard: 'assets/icons/vetmed-star.svg',
                                  numberCard: "4.5",
                                  textCard: 'Puntuación',
                                ),
                                ClinicInfoDollarCard(
                                  textCard: 'Costo',
                                  clinicPricing: 3,
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
                  ),
                  Positioned(
                    top: 420,
                    child: Container(
                      color: primaryWhite,
                      width: size.width,
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            const TitleText(
                              texto: 'Información de la clínica',
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const SimpleText(
                              texto:
                                  'La veterinaria cuenta con un equipamiento moderno y profesionales altamente capacitados, para conseguir un diagnóstico óptimo y un tratamiento efectivo de los animales, conversamos detenidamente con el dueño y nos tomamos el tiempo necesario para investigar a fondo con diferentes exámenes y llegar a un correcto diagnostico',
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const TitleText(
                              texto: 'Especialidades en la clínica',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 16,
                    child: Row(
                      children: [
                        ButtonBack(
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                        ),
                      ],
                    ),
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
    );
  }
}
