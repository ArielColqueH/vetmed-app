import 'package:cloud_firestore/cloud_firestore.dart';

class Clinic {
  String? clinicId;
  String? attentionAppointment;
  int? clinicAverageCost;
  String? clinicEmail;
  String? clinicName;
  String? clinicPhoto;
  String? contactNumber;
  int? numberOfClients;
  List<String>? positionCoordinate;
  String? clinicInformation;
  String? clinicLocation;
  List<String>? clinicServices;
  List<String>? veterinaryDoctors;
  double? clinicAveragePoints;

  Clinic({
    this.clinicId,
    this.attentionAppointment,
    this.clinicAverageCost,
    this.clinicEmail,
    this.clinicName,
    this.clinicPhoto,
    this.clinicServices,
    this.contactNumber,
    this.numberOfClients,
    this.positionCoordinate,
    this.veterinaryDoctors,
    this.clinicInformation,
    this.clinicLocation,
    this.clinicAveragePoints,
  });

  Map<String, dynamic> toJson() => {
        'clinicId': clinicId,
        'attentionAppointment': attentionAppointment,
        'clinicAverageCost': clinicAverageCost,
        'clinicEmail': clinicEmail,
        'clinicName': clinicName,
        'clinicPhoto': clinicPhoto,
        'contactNumber': contactNumber,
        'numberOfClients': numberOfClients,
        'positionCoordinate': positionCoordinate,
        'clinicInformation': clinicInformation,
        'clinicLocation': clinicLocation,
        'veterinaryDoctors': veterinaryDoctors,
        'clinicServices': clinicServices,
        'clinicAveragePoints': clinicAveragePoints,
      };

  static Clinic fromJson(Map<String, dynamic> json) => Clinic(
        clinicId: json['ClinicId'],
        attentionAppointment: json['AttentionAppointment'],
        clinicAverageCost: json['ClinicAverageCost'],
        clinicEmail: json['ClinicEmail'],
        clinicName: json['ClinicName'],
        clinicPhoto: json['ClinicPhoto'],
        numberOfClients: json['NumberOfClients'],
        clinicInformation: json['ClinicInformation'],
        clinicLocation: json['ClinicLocation'],
        contactNumber: json['ContactNumber'],
        clinicAveragePoints: json['ClinicAveragePoints'],
        // positionCoordinate: json['PositionCoordinate'],
        // clinicServices: json['ClinicServices'] as List<String>,
        // veterinaryDoctors: json['VeterinaryDoctors'] as List<String>,
      );
}
