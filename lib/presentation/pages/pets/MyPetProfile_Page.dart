import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vetmed_app/presentation/widgets/button-delete.dart';
import '../../../domain/entities/Pet.dart';
import '../../../utils/colors.dart';
import '../../widgets/main_widgets.dart';
import '../pets/widgets/pet_widgets.dart';

class MyPetProfilePage extends StatelessWidget {
  final String petId;

  const MyPetProfilePage({Key? key, required this.petId}) : super(key: key);

  Future<Pet?> readPet() async {
    // print("PetId: " + petId);
    final docPet = FirebaseFirestore.instance.collection("Pet").doc(petId);
    final snapshot = await docPet.get();
    if (snapshot.exists) {
      return Pet.fromJson(snapshot.data()!);
    } else {
      print("no existe el documento");
    }
  }

  @override
  Widget build(BuildContext context) {
    // Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
    print(petId);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: FutureBuilder<Pet?>(
          future: readPet(),
          builder: (context, snapshot) {
            print(snapshot.hasData);
            if (snapshot.hasData) {
              final petData = snapshot.data!;
              print(petData.petPhoto);
              return petData == null
                  ? Center(child: Text("No pet data"))
                  : Container(
                      height: 850,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            child: Container(
                              width: size.width,
                              height: 400.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(petData.petPhoto!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            width: size.width,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ButtonBack(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.pop(context, false);
                                    },
                                  ),
                                  ButtonDelete(
                                    color: Colors.white,
                                    onPressed: () {
                                      print("eliminar");
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 340,
                            child: Container(
                              decoration: BoxDecoration(
                                color: backgroundWhite,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              width: size.width,
                              height: 180,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 24,
                                    ),
                                    TitleText(
                                      texto:
                                          '${petData.petName} ${petData.petLastname}',
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClinicInfoCard(
                                            titleCardPet: "Raza",
                                            textCardPet: '${petData.petBreed}'),
                                        ClinicInfoCard(
                                            titleCardPet: "Sexo",
                                            textCardPet:
                                                '${petData.petGender}'),
                                        ClinicInfoCard(
                                            titleCardPet: "Edad",
                                            textCardPet:
                                                '${petYears(petData.petBornDate)}'),
                                        ClinicInfoCard(
                                            titleCardPet: "Peso",
                                            textCardPet:
                                                '${petData.petLastWeight} Kg'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 490,
                            child: Container(
                              decoration: BoxDecoration(
                                color: primaryWhite,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              width: size.width,
                              height: 600,
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
                                      height: 16,
                                    ),
                                    SimpleText(
                                      texto: '${petData.petBiography}',
                                    ),
                                    SizedBox(
                                      height: 42,
                                    ),
                                    ButtonNormal(
                                      color: primaryColor,
                                      text: 'Editar',
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/EditMyPetPage');
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
    );
  }

  String petYears(petBornDate) {
    String bornDate = petBornDate.toString().split(" ")[0];
    List<String>? datedata = bornDate.split("-");
    DateTime date1 = DateTime(
        int.parse(datedata[0]), int.parse(datedata[1]), int.parse(datedata[2]));
    DateTime date2 = DateTime.now();
    int difference = daysBetween(date1, date2);
    int years = (difference / 365).floor();
    // print("years" + years.toString());
    String value = "";
    if (years != 0) {
      value = years.toString() + " años";
    } else {
      value = difference.toString() + " dias";
    }
    return value;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }
}
