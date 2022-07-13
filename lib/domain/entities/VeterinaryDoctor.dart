import 'package:cloud_firestore/cloud_firestore.dart';

class VeterinaryDoctor {
  String? veterinaryDoctorId;
  String? email;
  String? password;
  String? name;
  String? lastname;
  String? cellphoneNumber;
  int? petServed;
  DateTime? timeOfExperience;
  List<String>? doctorSpeciality;
  String? biography;
  String? veterinaryDoctorPhoto;

  VeterinaryDoctor({
    this.veterinaryDoctorId,
    this.email,
    this.password,
    this.name,
    this.lastname,
    this.cellphoneNumber,
    this.petServed,
    this.timeOfExperience,
    this.doctorSpeciality,
    this.biography,
    this.veterinaryDoctorPhoto,
  });

  Map<String, dynamic> toJson() => {
        'veterinaryDoctorId': veterinaryDoctorId,
        'email': email,
        'password': password,
        'name': name,
        'lastname': lastname,
        'cellphoneNumber': cellphoneNumber,
        'petServed': petServed,
        'timeOfExperience': timeOfExperience,
        'doctorSpeciality': doctorSpeciality,
        'biography': biography,
        'veterinaryDoctorPhoto': veterinaryDoctorPhoto,
      };

  static VeterinaryDoctor fromJson(Map<String, dynamic> json) =>
      VeterinaryDoctor(
        veterinaryDoctorId: json['VeterinaryDoctorId'],
        email: json['Email'],
        password: json['Password'],
        name: json['Name'],
        lastname: json['Lastname'],
        cellphoneNumber: json['CellphoneNumber'],
        petServed: json['PetServed'],
        timeOfExperience: (json['TimeOfExperience'] as Timestamp).toDate(),
        doctorSpeciality: json['DoctorSpeciality'],
        biography: json['Biography'],
        veterinaryDoctorPhoto: json['VeterinaryPhoto'],
      );
}
