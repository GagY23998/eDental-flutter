import 'dart:async';

import 'package:edental/providers/dentistService.dart';
import 'package:flutter/material.dart';
import 'package:edental/models/dentist.dart';

class DentistProvider extends ChangeNotifier {
  List<Dentist> _dentist = [];

  List<Dentist> get dentists => [..._dentist];

  final DentistService dentistService = DentistService();

  Future<List<Dentist>> getDentistsAsync() async => dentistService.getAll();
  List<Dentist> getDentists() {
    dentistService.getAll().then((val) {
      _dentist = val;
    }).onError((error, stackTrace) {
      _dentist = [];
    });
    return dentists;
  }

  List<DropdownMenuItem> getDentistsDropdown() {
    if (_dentist.isNotEmpty) {
      return dentists
          .map((dentist) =>
              DropdownMenuItem(value: dentist, child: Text(dentist.fullName)))
          .toList();
    }
    return [];
  }
}
