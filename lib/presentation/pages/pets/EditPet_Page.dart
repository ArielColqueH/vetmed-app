import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/Pet.dart';
import '../../../utils/colors.dart';
import '../../widgets/main_widgets.dart';

class EditMyPetPage extends StatefulWidget {
  final String petId;

  const EditMyPetPage({Key? key, required this.petId}) : super(key: key);

  @override
  State<EditMyPetPage> createState() => _EditMyPetPageState();
}

class _EditMyPetPageState extends State<EditMyPetPage> {
  Future<Pet?> readPet() async {
    final docPet =
        FirebaseFirestore.instance.collection("Pet").doc(widget.petId);
    final snapshot = await docPet.get();
    if (snapshot.exists) {
      return Pet.fromJson(snapshot.data()!);
    } else {
      print("no existe el documento");
    }
  }

  final _namePetTextController = TextEditingController();
  final _infoPetTextController = TextEditingController();
  final _breedPetTextController = TextEditingController();
  final _microchipPetTextController = TextEditingController();

  double ageDog = 0;
  double weigthDog = 0;
  String valorInicial = "Macho";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: FutureBuilder<Pet?>(
            future: readPet(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final petData = snapshot.data!;
                return petData == null
                    ? Center(child: Text("No pet data"))
                    : Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 40,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 40,
                            ),
                            ButtonBack(
                              color: secondaryColor,
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const TitleText(
                              texto: 'Editar mascota',
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const TitleText(
                              texto: 'Datos de tu mascota',
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            InputNormal(
                              placeholder: 'Nombre',
                              textEditingController: _namePetTextController,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            InputNormal(
                              placeholder: 'Información de mascota',
                              textEditingController: _infoPetTextController,
                              isTextArea: true,
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            const TitleText(
                              texto: 'Detalles generales',
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            InputNormal(
                              placeholder: 'Raza',
                              textEditingController: _breedPetTextController,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            InputNormal(
                              placeholder: 'Microchip',
                              textEditingController:
                                  _microchipPetTextController,
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            TitleText(
                              texto: 'Género',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Multiselector(
                                  onPressed: () {
                                    setState(() {
                                      valorInicial = "Macho";
                                    });
                                    print(valorInicial);
                                  },
                                  buttonText: 'Macho',
                                  icon: 'assets/icons/vetmed-male.svg',
                                  selectableItem: 'Macho',
                                  selectableGroup: valorInicial,
                                ),
                                SizedBox(
                                  width: 7,
                                ),
                                Multiselector(
                                  onPressed: () {
                                    setState(() {
                                      valorInicial = "Hembra";
                                    });
                                    print(valorInicial);
                                  },
                                  buttonText: 'Hembra',
                                  icon: 'assets/icons/vetmed-female.svg',
                                  selectableItem: 'Hembra',
                                  selectableGroup: valorInicial,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            TitleText(
                              texto: 'Edad',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Slider(
                                thumbColor: primaryColor,
                                inactiveColor: terciaryColor,
                                activeColor: primaryColor,
                                label: "$ageDog",
                                divisions: 15,
                                min: 0,
                                max: 15,
                                value: ageDog,
                                onChanged: (newRating) {
                                  setState(() {
                                    ageDog = newRating;
                                  });
                                }),
                            SizedBox(
                              height: 24,
                            ),
                            TitleText(
                              texto: 'Peso',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Slider(
                                thumbColor: primaryColor,
                                inactiveColor: terciaryColor,
                                activeColor: primaryColor,
                                label: "$weigthDog",
                                divisions: 20,
                                min: 0,
                                max: 20,
                                value: weigthDog,
                                onChanged: (newRating) {
                                  setState(() {
                                    weigthDog = newRating;
                                  });
                                }),
                            SizedBox(
                              height: 24,
                            ),
                            TitleText(
                              texto: 'Imágenes',
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PhotosIcon(
                                  iconPhoto: Icons.camera_alt,
                                  color: primaryColor,
                                  onPressed: () {},
                                  textIcon: 'Sacar foto',
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                PhotosIcon(
                                  iconPhoto: Icons.photo,
                                  color: primaryColor,
                                  textIcon: 'Seleccionar',
                                  onPressed: () {},
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
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
                            SizedBox(
                              height: 40,
                            ),
                            ButtonNormal(
                              color: primaryColor,
                              text: 'Guardar',
                              onPressed: () {},
                            )
                          ],
                        ),
                      );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
