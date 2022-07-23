import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/colors.dart';
import '../../widgets/main_widgets.dart';

class AddMyPetPage extends StatefulWidget {
  const AddMyPetPage({Key? key}) : super(key: key);

  @override
  State<AddMyPetPage> createState() => _AddMyPetPageState();
}

class _AddMyPetPageState extends State<AddMyPetPage> {
  final _namePetTextController = TextEditingController();
  final _lastnamePetTextController = TextEditingController();
  final _infoPetTextController = TextEditingController();
  final _breedPetTextController = TextEditingController();
  final _microchipPetTextController = TextEditingController();
  final _bornDatePetTextController = TextEditingController();
  final _weightPetTextController = TextEditingController();
  double ageDog = 0;
  double weigthDog = 0;
  String petGender = "Macho";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
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
                texto: 'Agregar mascota',
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
                placeholder: 'Apellido',
                textEditingController: _lastnamePetTextController,
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
                textEditingController: _microchipPetTextController,
              ),
              const SizedBox(
                height: 8,
              ),
              InputNormal(
                placeholder: 'Fecha de nacimiento',
                textEditingController: _bornDatePetTextController,
              ),
              const SizedBox(
                height: 8,
              ),
              InputNormal(
                placeholder: 'Peso',
                textEditingController: _weightPetTextController,
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
                        petGender = "Macho";
                      });
                      // print(petGender);
                    },
                    buttonText: 'Macho',
                    icon: 'assets/icons/vetmed-male.svg',
                    selectableItem: 'Macho',
                    selectableGroup: petGender,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Multiselector(
                    onPressed: () {
                      setState(() {
                        petGender = "Hembra";
                      });
                      // print(valorInicial);
                    },
                    buttonText: 'Hembra',
                    icon: 'assets/icons/vetmed-female.svg',
                    selectableItem: 'Hembra',
                    selectableGroup: petGender,
                  ),
                ],
              ),
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
                text: 'Agregar mascota',
                onPressed: () {
                  final petName = _namePetTextController.text;
                  final petLastname = _lastnamePetTextController.text;
                  final petInfo = _infoPetTextController.text;
                  final petBreed = _breedPetTextController.text;
                  final petMicrochip = _microchipPetTextController.text;
                  final petBorn = _bornDatePetTextController.text;
                  final petWeight = _weightPetTextController.text;
                  createPet(
                    petname: petName,
                    petlastname: petLastname,
                    petinfo: petInfo,
                    petbreed: petBreed,
                    petmicrochip: petMicrochip,
                    petborn: petBorn,
                    petweight: petWeight,
                    petgender: petGender,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future createPet({
    required String petname,
    required String petlastname,
    required String petinfo,
    required String petbreed,
    required String petmicrochip,
    required String petborn,
    required String petweight,
    required String petgender,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance.collection('Pet').doc();
    final json = {
      'PetName': petname,
      'PetLastname': petlastname,
      'PetBiography': petinfo,
      'PetBreed': petbreed,
      'PetLastWeight': petweight,
      'PetMicrochip': petmicrochip,
      'PetBornDate': petborn,
      'PetGender': petgender,
      'PetOwnerId': user?.uid,
    };
    await docUser.set(json);
  }
}
