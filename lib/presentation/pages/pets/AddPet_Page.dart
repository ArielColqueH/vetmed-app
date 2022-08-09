import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../utils/colors.dart';
import '../../widgets/main_widgets.dart';
import 'package:intl/intl.dart';

class AddMyPetPage extends StatefulWidget {
  const AddMyPetPage({Key? key}) : super(key: key);

  @override
  State<AddMyPetPage> createState() => _AddMyPetPageState();
}

class _AddMyPetPageState extends State<AddMyPetPage> {
  // DateTime dateToday =  DateTime.now().toUtc();
  // Timestamp _stampdate =

  DateTime dateToday = DateTime.now();
  final _namePetTextController = TextEditingController();
  final _lastnamePetTextController = TextEditingController();
  final _infoPetTextController = TextEditingController();
  final _breedPetTextController = TextEditingController();
  final _microchipPetTextController = TextEditingController();
  final _bornDatePetTextController = TextEditingController();
  final _weightPetTextController = TextEditingController();
  String petPhoto = "";
  double ageDog = 0;
  double weigthDog = 0;
  String petGender = "Macho";

  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    setState(() {
      pickedFile = result.files.first;
    });
  }

  Future uploadFile() async {
    final path = 'files/${pickedFile!.name}';
    final file = File(pickedFile!.path!);

    final ref = FirebaseStorage.instance.ref().child(path);
    setState(() {
      uploadTask = ref.putFile(file);
    });

    final snapshot = await uploadTask!.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();
    petPhoto = urlDownload.toString();
    // print('url impreso' + petPhoto);
    // print("here");
    // print('download link $urlDownload');
    setState(() {
      uploadTask = null;
    });
  }

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
              // InputNormal(
              //   placeholder: 'Fecha de nacimiento',
              //   textEditingController: _bornDatePetTextController,
              // ),
              TextField(
                controller: _bornDatePetTextController,
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: primaryBlack),
                  labelText: "Ingresa la fecha de nacimiento",
                  hintText: "Fecha de nacimiento",
                  hoverColor: primaryColor,
                  focusedBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide: BorderSide(
                      color: primaryColor,
                      width: 1.0,
                    ),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () async {
                      print("timenow ${dateToday}");
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: dateToday,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (newDate == null) return;
                      setState(() {
                        dateToday = newDate.add(new Duration(hours: 12));
                        // print("date ${dateToday} ${newDate}");
                        // _bornDatePetTextController.text = dateToday.toString();
                        _bornDatePetTextController.text =
                            "${dateToday.day} / ${dateToday.month} / ${dateToday.year}";
                      });
                    },
                    icon: const Icon(Icons.calendar_today),
                    color: primaryColor,
                  ),
                ),
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
                    iconPhoto: Icons.photo,
                    color: primaryColor,
                    textIcon: 'Seleccionar',
                    onPressed: selectFile,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  if (pickedFile != null)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.file(
                        File(pickedFile!.path!),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              ButtonNormal(
                color: primaryColor,
                text: 'Agregar mascota',
                onPressed: () async {
                  await uploadFile();
                  final petName = _namePetTextController.text;
                  final petLastname = _lastnamePetTextController.text;
                  final petInfo = _infoPetTextController.text;
                  final petBreed = _breedPetTextController.text;
                  final petMicrochip = _microchipPetTextController.text;
                  final petBorn = Timestamp.fromDate(dateToday);
                  final petWeight = _weightPetTextController.text;
                  await createPet(
                    petname: petName,
                    petlastname: petLastname,
                    petinfo: petInfo,
                    petbreed: petBreed,
                    petmicrochip: petMicrochip,
                    petborn: petBorn,
                    petweight: petWeight,
                    petgender: petGender,
                    petphoto: petPhoto,
                  );
                  Navigator.of(context).pushNamed('/MyPetsPage');
                  _showActionSnackBar(context);

                },
              ),
              buildProgress(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
          print(progress);
          return Container(
            color: Colors.red,
            child: SizedBox(
              height: 50,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.green,
                  ),
                  Center(
                    child: Text(
                      '${(100 * progress).roundToDouble()}%',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.orange,
            child: const SizedBox(
              height: 50,
            ),
          );
        }
      });

  Future createPet({
    required String petname,
    required String petlastname,
    required String petinfo,
    required String petbreed,
    required String petmicrochip,
    required Timestamp petborn,
    required String petweight,
    required String petgender,
    required String petphoto,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final docUser = FirebaseFirestore.instance.collection('Pet').doc();
    final json = {
      'PetId': docUser.id,
      'PetName': petname,
      'PetLastname': petlastname,
      'PetBiography': petinfo,
      'PetBreed': petbreed,
      'PetLastWeight': petweight,
      'PetMicrochip': petmicrochip,
      'PetBornDate': petborn,
      'PetGender': petgender,
      'PetOwnerId': user?.uid,
      'PetPhoto': petphoto,
    };
    await docUser.set(json);
    // if(){
    //   Navigator.of(context).pushNamed('/MyPetsPage');
    // }

  }

  void _showActionSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(milliseconds: 10000),
      content: const Text("Se agrego mascota a tu registro"),
      action: SnackBarAction(
        onPressed: () {
          Navigator.of(context).pushNamed('/MyPetsPage');
        },
        label: 'Ok',
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
