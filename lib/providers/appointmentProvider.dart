import 'dart:async';
import 'package:edental/apimodels/appointmentSearchRequest.dart';
import 'package:edental/components/appointment_item.dart';
import 'package:edental/providers/appointmentService.dart';
import 'package:edental/models/appointment.dart' as models;
import 'package:flutter/material.dart';
import '../models/appointment.dart';
import 'package:collection/collection.dart';

import '../models/user.dart';

class AppointmentProvider extends ChangeNotifier {
  List<models.Appointment> _appointments = [];
  late User _user;
  bool isInitialized = false;
  int? treatmentId;
  int? dentistId;
  AppointmentService appointmentService = AppointmentService();
  AppointmentProvider(user) {
    if (user != null) {
      _user = user;
      appointmentService =
          AppointmentService(username: user.username, password: user.password);
    }
  }
  List<models.Appointment> get appointments => [..._appointments];

  DateTime firstDayOfWeek = DateTime.now();
  DateTime lastDayOfWeek = DateTime.now();

  DateTimeRange? get weekRange =>
      DateTimeRange(start: firstDayOfWeek, end: lastDayOfWeek);

  Future<List<Appointment>> initializeValues() async {
    if (_user.id != 0) {
      calculateFirstAndLastDayOfCurrentWeek();
      _appointments = await fetchAppointmentsForUser();
      isInitialized = true;
    }
    return appointments;
  }

  Future<Appointment> createAppointment(Appointment? newAppointment) async {
    if (newAppointment != null) {
      final result = await appointmentService.create(newAppointment);
      if (result != null) {
        _appointments.add(result);
        notifyListeners();
      }

      return result;
    }
    // ignore: null_argument_to_non_null_type
    return Future.value(null);
  }

  AppointmentProvider update(int userId, String userName, String password) {
    userId = userId;
    appointmentService =
        AppointmentService(username: userName, password: password);
    return this;
  }

  FutureOr<List<models.Appointment>> fetchAppointmentsForUser(
      {int? dentistId}) async {
    AppointmentSearchRequest searchRequest = AppointmentSearchRequest();
    // searchRequest.userId = _user.id;
    // gotta check communication between the 2 notiifers
    searchRequest.dentistId = dentistId; //  na osnovu userId i dentista
    // pokupiti sve appointmente
    searchRequest.treatmentId = treatmentId;
    searchRequest.start = firstDayOfWeek;
    searchRequest.end = lastDayOfWeek;
    List<models.Appointment> appointments =
        await appointmentService.find(searchRequest, path: '/filtering');
    _appointments = appointments;
    notifyListeners();
    return appointments;
  }

  void setDentistAppointments(int id) {
    dentistId = id;
    notifyListeners();
  }

  void calculateFirstAndLastDayOfCurrentWeek() {
    DateTime todaysDate = DateTime.now();
    todaysDate = DateTime(todaysDate.year, todaysDate.month, todaysDate.day);
    int dayOfWeek = todaysDate.weekday;
    firstDayOfWeek = todaysDate.add(Duration(days: -(dayOfWeek - 1)));
    lastDayOfWeek = todaysDate.add(Duration(days: 7 - dayOfWeek));
  }

  bool isAppointmentInGivenHour(Appointment appointment, DateTime hour) =>
      (appointment.start.isBefore(hour) ||
          appointment.start.isAtSameMomentAs(hour)) &&
      (appointment.end.isAfter(hour) || appointment.end.isAtSameMomentAs(hour));

  List<AppointmentItem> setAppointmentItemsForDay(
      List<Appointment> appointments, int weekDay) {
    List<Appointment> weekAppointments = appointments
        .where((element) => element.start.weekday == weekDay)
        .toList();
    List<AppointmentItem> appointmentsForDay = [];
    for (int hourOfDay = 8; hourOfDay <= 18; hourOfDay++) {
      DateTime currentDate =
          firstDayOfWeek.add(Duration(days: weekDay - firstDayOfWeek.weekday));
      DateTime dateForHour = DateTime(
          currentDate.year, currentDate.month, currentDate.day, hourOfDay);
      Appointment? foundAppointment = weekAppointments.firstWhereOrNull(
          (element) => isAppointmentInGivenHour(element, dateForHour));
      appointmentsForDay.add(AppointmentItem(
        appointmentHour: dateForHour,
        appointment: foundAppointment,
      ));
    }
    return appointmentsForDay;
  }

  Future<Map<int, List<AppointmentItem>>> calculateAppointmentsForWeek() async {
    if (!isInitialized) {
      await initializeValues();
    }
    Map<int, List<AppointmentItem>> items = {};
    for (int i = 1; i <= 7; i++) {
      items.putIfAbsent(i, () => setAppointmentItemsForDay(appointments, i));
    }
    return items;
  }

  Future<void> setWeekDaysFromRange(DateTimeRange dateTimeRange) async {
    firstDayOfWeek = dateTimeRange.start;
    lastDayOfWeek = dateTimeRange.end;
    await fetchAppointmentsForUser();
    notifyListeners();
  }
}
