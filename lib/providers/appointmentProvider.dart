import 'dart:async';
import 'package:edental/apimodels/appointmentSearchRequest.dart';
import 'package:edental/providers/appointmentService.dart';
import 'package:edental/models/appointment.dart' as models;
import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../models/user.dart';

class AppointmentProvider extends ChangeNotifier {
  List<models.Appointment> _appointments = [];
  int? userId;
  int? dentistId;
  int? treatmentId;
  AppointmentService appointmentService = AppointmentService();
  AppointmentProvider(userId, username, password) {
    appointmentService =
        AppointmentService(username: username, password: password);
  }
  List<models.Appointment> get appointments => [..._appointments];

  DateTime firstDayOfWeek = DateTime.now();
  DateTime lastDayOfWeek = DateTime.now();

  DateTimeRange? get weekRange =>
      DateTimeRange(start: firstDayOfWeek, end: lastDayOfWeek);

  Future<List<Appointment>> initializeValues() async {
    calculateFirstAndLastDayOfCurrentWeek();
    _appointments = await fetchAppointmentsForUser();
    return appointments;
  }

  FutureOr<List<models.Appointment>> fetchAppointmentsForUser(
      {int? dentistId}) async {
    AppointmentSearchRequest searchRequest = AppointmentSearchRequest();
    searchRequest.userId = userId ?? 0;
    // gotta check communication between the 2 notiifers
    searchRequest.dentistId = dentistId ?? 0; //  na osnovu userId i dentista
    // pokupiti sve appointmente
    searchRequest.treatmentId = treatmentId ?? 0;
    searchRequest.start = firstDayOfWeek;
    searchRequest.end = lastDayOfWeek;
    String check = DateTime.now().toIso8601String();
    List<models.Appointment> appointments =
        await appointmentService.find(searchRequest, path: '/filtering');
    return appointments;
  }

  void setDentistAppointments(int id) {
    dentistId = id;
    notifyListeners();
  }

  void calculateFirstAndLastDayOfCurrentWeek() {
    DateTime todaysDate = DateTime.now();
    int dayOfWeek = todaysDate.weekday;
    firstDayOfWeek = todaysDate.add(Duration(days: -(dayOfWeek - 1)));
    lastDayOfWeek = todaysDate.add(Duration(days: 7 - dayOfWeek));
  }
}
