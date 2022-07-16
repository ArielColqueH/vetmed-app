import 'package:cloud_firestore/cloud_firestore.dart';

class PetOwner {
  String? petOwnerId;
  String? email;
  String? password;
  String? cellphoneNumber;
  String? name;
  String? lastName;
  int? numClinicsFrecuented;
  int? numViewsAtClinics;
  String? streatOfHouse;
  String? numOfHouse;
  String? zone;
  String? city;
  String? petOwnerPhoto;
  String? relativeRole;
  String? familyGroup;

  PetOwner({
    this.petOwnerId,
    this.email,
    this.password,
    this.cellphoneNumber,
    this.name,
    this.lastName,
    this.numClinicsFrecuented,
    this.numViewsAtClinics,
    this.streatOfHouse,
    this.numOfHouse,
    this.zone,
    this.city,
    this.petOwnerPhoto,
    this.relativeRole,
    this.familyGroup,
  });

  Map<String, dynamic> toJson() => {
        'petOwnerId': petOwnerId,
        'email': email,
        'password': password,
        'cellphoneNumber': cellphoneNumber,
        'name': name,
        'lastName': lastName,
        'numClinicsFrecuented': numClinicsFrecuented,
        'numViewsAtClinics': numViewsAtClinics,
        'streatOfHouse': streatOfHouse,
        'numOfHouse': numOfHouse,
        'zone': zone,
        'city': city,
        'petOwnerPhoto': petOwnerPhoto,
        'relativeRole': relativeRole,
        'familyGroup': familyGroup,
      };

  static PetOwner fromJson(Map<String, dynamic> json) => PetOwner(
        petOwnerId: json['PetOwnerId'],
        email: json['Email'],
        password: json['Password'],
        cellphoneNumber: json['CellphoneNumber'],
        name: json['Name'],
        lastName: json['Lastname'],
        numClinicsFrecuented: json['NumClinicsFrecuented'],
        numViewsAtClinics: json['NumViewsAtClinics'],
        streatOfHouse: json['StreatOfHouse'],
        numOfHouse: json['NumOfHouse'],
        zone: json['zone'],
        city: json['City'],
        petOwnerPhoto: json['PetOwnerPhoto'],
        relativeRole: json['RelativeRole'],
        familyGroup: json['FamilyGroup'],
      );
}
