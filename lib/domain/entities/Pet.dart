import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
  String? petName;
  String? petLastname;
  String? petOwner;
  String? petGender;
  String? petBreed;
  DateTime? petBornDate;
  String? petBiography;
  double? petLastWeight;
  String? petMicrochip;
  String? petPhoto;

  Pet({
    this.petName,
    this.petLastname,
    this.petOwner,
    this.petGender,
    this.petBreed,
    this.petBornDate,
    this.petBiography,
    this.petLastWeight,
    this.petMicrochip,
    this.petPhoto,
  });

  Map<String, dynamic> toJson() => {
        'petName': petName,
        'petLastname': petLastname,
        'petOwner': petOwner,
        'petGender': petGender,
        'petBreed': petBreed,
        'petBornDate': petBornDate,
        'petBiography': petBiography,
        'petLastWeight': petLastWeight,
        'petMicrochip': petMicrochip,
        'petPhoto': petPhoto,
      };

  static Pet fromJson(Map<String, dynamic> json) => Pet(
        petName: json['PetName'],
        petLastname: json['PetLastname'],
        petOwner: json['PetOwner'],
        petGender: json['PetGender'],
        petBreed: json['PetBreed'],
        petBiography: json['PetBiography'],
        petMicrochip: json['PetMicrochip'],
        petPhoto: json['PetPhoto'],
        petBornDate: (json['PetBornDate'] as Timestamp).toDate(),
        // petLastWeight: json['PetLastWeight'],
      );
}
