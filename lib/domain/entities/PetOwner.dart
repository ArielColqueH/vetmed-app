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
        'name': name,
        'lastName': lastName,
        'cellphoneNumber': cellphoneNumber,
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
        name: json['Name'],
        lastName: json['Lastname'],
        password: json['Password'],
        cellphoneNumber: json['CellphoneNumber'],
        numClinicsFrecuented: json['NumClinicsFrecuented'],
        numViewsAtClinics: json['NumViewsAtClinics'],
        streatOfHouse: json['StreatOfHouse'],
        numOfHouse: json['NumOfHouse'],
        zone: json['Zone'],
        city: json['City'],
        petOwnerPhoto: json['PetOwnerPhoto'],
        relativeRole: json['RelativeRole'],
        familyGroup: json['FamilyGroup'],
      );
}
// final Timestamp timestamp = snapshot.data['timestamp'] as Timestamp;
// final DateTime dateTime = timestamp.toDate();
// final dateString = DateFormat('K:mm:ss').format(dateTime);