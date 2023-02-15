import 'package:edental/providers/treatmentService.dart';
import 'package:flutter/material.dart';

import '../models/treatment.dart';

class TreatmentProvider extends ChangeNotifier {
  List<Treatment> _treatments = [];
  List<Treatment> get treatments => [...treatments];
  TreatmentService _service = TreatmentService();
  TreatmentProvider(userName, password) {
    _service = TreatmentService(username: userName, password: password);
  }
  List<Treatment> getTreatments() {
    _service.getAll().then((value) {
      _treatments = value;
      notifyListeners();
    }).catchError((er) {
      _treatments = [];
      notifyListeners();
    });
    return treatments;
  }
}
