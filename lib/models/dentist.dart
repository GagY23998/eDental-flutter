import 'dart:typed_data';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Dentist {
  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  DateTime birthDate;
  int dentistOfficeId;
  ByteBuffer image;
  String description;
  bool active;
  String fullName;

  Dentist(
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.address,
    this.birthDate,
    this.dentistOfficeId,
    this.image,
    this.description,
    this.active,
    this.fullName,
  );
}
