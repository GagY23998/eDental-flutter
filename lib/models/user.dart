import 'dart:typed_data';

import '../enums/gender.dart';
import '../enums/role.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class User {
  int? id;
  String firstName;
  String lastName;
  String username;
  String? phone;
  String email;
  String? address;
  String? password;
  String? passwordConfirm;
  Role? role;
  Gender? gender;
  ByteBuffer? image;
  String get fullName => '$firstName $lastName';

  User({
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.phone,
    this.email = '',
    this.address,
    this.password,
    this.passwordConfirm,
    this.role,
    this.gender,
    this.image,
  });
}
