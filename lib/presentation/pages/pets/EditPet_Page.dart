import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
  String petGender = "";

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

  Future getDocs() async {
    var collection = FirebaseFirestore.instance.collection('Pet');
    var querySnapshot = await collection.get();
    for (var queryDocumentSnapshot in querySnapshot.docs) {
      print(queryDocumentSnapshot.id + "-" + widget.petId);
      if (queryDocumentSnapshot.id == widget.petId) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();
        Timestamp t = data['PetBornDate'];
        DateTime d = t.toDate();
        String date = d.toString().split(" ")[0];
        final List<String> fulldate = date.split("-");
        _namePetTextController.text = data['PetName'];
        _lastnamePetTextController.text = data['PetLastname'];
        _infoPetTextController.text = data['PetBiography'];
        _breedPetTextController.text = data['PetBreed'];
        _microchipPetTextController.text = data['PetMicrochip'];
        _bornDatePetTextController.text =
            "${fulldate[2]} / ${fulldate[1]} / ${fulldate[0]}";
        _weightPetTextController.text = data['PetLastWeight'];
        petGender = data['PetGender'];
      }
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    getDocs();
  }

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
                              height: 16,
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
                                    DateTime? newDate = await showDatePicker(
                                      context: context,
                                      initialDate: dateToday,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2100),
                                    );
                                    if (newDate == null) return;
                                    setState(() {
                                      dateToday =
                                          newDate.add(new Duration(hours: 12));
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
                              placeholder: 'Peso en Kg',
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
                                    // print(petGender);
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
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.center,
                            //   children: [
                            //     PhotosIcon(
                            //       iconPhoto: Icons.photo,
                            //       color: primaryColor,
                            //       textIcon: 'Cambiar foto',
                            //       onPressed: () {},
                            //     ),
                            //     SizedBox(
                            //       width: 30,
                            //     ),
                            //     ClipRRect(
                            //       borderRadius: BorderRadius.circular(5.0),
                            //       child: Image.network(
                            //         fit: BoxFit.cover,
                            //         '${petData.petPhoto}',
                            //         height: 100.0,
                            //         width: 100.0,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 40,
                            ),
                            ButtonNormal(
                              color: primaryColor,
                              text: 'Guardar',
                              onPressed: () {
                                final petName = _namePetTextController.text;
                                final petLastname =
                                    _lastnamePetTextController.text;
                                final petInfo = _infoPetTextController.text;
                                final petBreed = _breedPetTextController.text;
                                final petMicrochip =
                                    _microchipPetTextController.text;
                                final petBorn = Timestamp.fromDate(dateToday);
                                final petWeight = _weightPetTextController.text;
                                updatePet(
                                  petId: widget.petId,
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
                              },
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

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;
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

  Future updatePet({
    required String petId,
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
    final docUser = FirebaseFirestore.instance.collection('Pet').doc(petId);
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
    await docUser.update(json);
  }
}
