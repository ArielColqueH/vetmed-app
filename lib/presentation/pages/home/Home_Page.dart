import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vetmed_app/domain/entities/PetOwner.dart';
import 'package:vetmed_app/presentation/components/bottomnav.dart';
import 'package:vetmed_app/presentation/pages/authentication/SignUp_Page.dart';
import 'package:vetmed_app/provider/google_sign_in.dart';

import '../../../domain/entities/Clinic.dart';
import '../../../domain/entities/VeterinaryDoctor.dart';
import '../../../utils/main_utils.dart';
import '../../widgets/main_widgets.dart';
import '../authentication/Login_Page.dart';
import '../home/widgets/home_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Stream<List<VeterinaryDoctor>> readVeterinaries() =>
      FirebaseFirestore.instance.collection('VeterinaryDoctor').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => VeterinaryDoctor.fromJson(doc.data()))
              .toList());

  Stream<List<Clinic>> readClinics() => FirebaseFirestore.instance
      .collection('Clinic')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Clinic.fromJson(doc.data())).toList());

  Stream<List<PetOwner>> readPetOwner() => FirebaseFirestore.instance
      .collection('PetOwner')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => PetOwner.fromJson(doc.data())).toList());

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
                  Expanded(
                    child: StreamBuilder<List<Clinic>>(
                        stream: readClinics(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final clinicLists = snapshot.data!;
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: clinicLists.length,
                              itemBuilder: (context, index) => ClinicItem(
                                clinicStars:
                                    clinicLists[index].clinicAveragePoints!,
                                clinicLocation:
                                    "${clinicLists[index].clinicLocation}",
                                clinicName: "${clinicLists[index].clinicName}",
                                clinicPricing:
                                    clinicLists[index].clinicAverageCost!,
                                clinicImage:
                                    "${clinicLists[index].clinicPhoto}",
                                clinicAttention:
                                    clinicLists[index].numberOfClients!,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/ClinicProfilePage');
                                },
                              ),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
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
                  Expanded(
                    child: StreamBuilder<List<VeterinaryDoctor>>(
                      stream: readVeterinaries(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final veterinaryDoctorList = snapshot.data!;
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: veterinaryDoctorList.length,
                            itemBuilder: (context, index) => DoctorItem(
                              doctorImage:
                                  '${veterinaryDoctorList[index].veterinaryDoctorPhoto}',
                              doctorName:
                                  '${veterinaryDoctorList[index].name} ${veterinaryDoctorList[index].lastname}',
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed('/DoctorProfilePage');
                              },
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
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
