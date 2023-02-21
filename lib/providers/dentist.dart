import 'dart:async';

import 'package:edental/providers/dentistService.dart';
import 'package:edental/providers/recommendationService.dart';
import 'package:flutter/material.dart';
import 'package:edental/models/dentist.dart';

import '../models/user.dart';

class DentistProvider extends ChangeNotifier {
  List<Dentist> _dentist = [];
  late final User _user;
  List<Dentist> get dentists => [..._dentist];
  final DentistService dentistService = DentistService();
  RecommendationService recommendationService = RecommendationService();

  DentistProvider(User? user) {
    if (user != null) {
      _user = user;
      recommendationService = RecommendationService(
          username: _user.username, password: _user.password);
    }
  }

  Future<List<Dentist>> getDentistsAsync() async =>
      _dentist.isEmpty ? dentistService.getAll() : Future.value(dentists);
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

  Future<List<Dentist>> getRecommendedDentistAsync({int id = 1}) async {
    return await recommendationService.getMultipleById(
      id,
    );
  }
}
