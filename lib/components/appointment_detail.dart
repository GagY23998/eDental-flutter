import 'package:edental/models/appointment.dart';
import 'package:edental/models/dentist.dart';
import 'package:edental/models/treatment.dart';
import 'package:edental/providers/appointmentProvider.dart';
import 'package:edental/providers/auth.dart';
import 'package:edental/providers/dentist.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/treatmentProvider.dart';
import 'appointment_item.dart';

class AppointmentDetail extends StatefulWidget {
  AppointmentDetail(this.appointmentItem, {super.key});
  final AppointmentItem appointmentItem;
  @override
  State<AppointmentDetail> createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  int selectedDentistId = 0;
  int selectedTreatmentId = 0;
  bool isSaveButtonEnabled = false;

  Appointment? makeReservation(int userId) {
    if (isSaveButtonEnabled) {
      Appointment appointment = Appointment(
          0,
          widget.appointmentItem.appointmentHour,
          widget.appointmentItem.appointmentHour.add(const Duration(hours: 1)),
          selectedDentistId,
          selectedTreatmentId,
          userId,
          '',
          '',
          '');
      return appointment;
    }
    return null;
  }

  bool enableButtonSaving() {
    return !widget.appointmentItem.IsReserved &&
        selectedDentistId != 0 &&
        selectedTreatmentId != 0;
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    final dentistsProvider = Provider.of<DentistProvider>(context);
    final treatment = Provider.of<TreatmentProvider>(context);
    final appointments = Provider.of<AppointmentProvider>(context);
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            children: [
              Center(
                child: TextFormField(
                  decoration: const InputDecoration(label: Text('Start date')),
                  readOnly: widget.appointmentItem.IsReserved,
                  initialValue: DateFormat('dd.MM.yyyy H:mm').format(
                      widget.appointmentItem.IsReserved
                          ? widget.appointmentItem.appointment!.start
                          : widget.appointmentItem.appointmentHour),
                ),
              ),
              TextFormField(
                initialValue: DateFormat('dd.MM.yyyy H:mm').format(
                    widget.appointmentItem.IsReserved
                        ? widget.appointmentItem.appointment!.end
                        : widget.appointmentItem.appointmentHour
                            .add(const Duration(hours: 1))),
                decoration: const InputDecoration(label: Text('End date')),
                readOnly: widget.appointmentItem.IsReserved,
              ),
              FutureBuilder<List<Dentist>>(
                  future: dentistsProvider.getDentistsAsync(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                            heightFactor: .3,
                            widthFactor: 0.8,
                            child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    disabledHint:
                                        widget.appointmentItem.IsReserved
                                            ? Text(snapshot.data!
                                                .firstWhere((e) =>
                                                    e.id ==
                                                    widget.appointmentItem
                                                        .appointment!.dentistId)
                                                .fullName)
                                            : null,
                                    elevation: 2,
                                    dropdownColor: Colors.deepPurpleAccent,
                                    items: widget.appointmentItem.IsReserved
                                        ? []
                                        : snapshot.data!
                                            .map((e) => DropdownMenuItem(
                                                  value: e.id,
                                                  child: Text(e.fullName),
                                                ))
                                            .toList(),
                                    onChanged: (val) {
                                      setState(() {
                                        selectedDentistId = val as int;
                                        isSaveButtonEnabled =
                                            enableButtonSaving();
                                      });
                                    }))),
                      );
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return const Text('No data');
                    }
                    return const Text('This shouldn\'t be displayed');
                  }),
              FutureBuilder<List<Treatment>>(
                  future: treatment.getTreatments(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Center(
                          child: DropdownButtonHideUnderline(
                              child: widget.appointmentItem.IsReserved
                                  ? DropdownButton(
                                      disabledHint:
                                          widget.appointmentItem.IsReserved
                                              ? Text(snapshot.data!
                                                  .firstWhere((e) =>
                                                      e.id ==
                                                      widget
                                                          .appointmentItem
                                                          .appointment!
                                                          .dentistId)
                                                  .name)
                                              : null,
                                      value: snapshot.data!
                                          .where((e) =>
                                              e.id ==
                                              widget.appointmentItem
                                                  .appointment!.dentistId)
                                          .map((e) => DropdownMenuItem(
                                                value: e.id,
                                                child: Text(e.name),
                                              ))
                                          .first,
                                      onChanged: null,
                                      items: [],
                                    )
                                  : DropdownButton(
                                      items: treatment.getDropdown(),
                                      onChanged: (value) => setState(() {
                                            selectedTreatmentId = value;

                                            isSaveButtonEnabled =
                                                enableButtonSaving();
                                          }))));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasError) {
                      return const Text('No data');
                    }
                    return const Text('How you come here man ?');
                  }),
              !widget.appointmentItem.IsReserved
                  ? ElevatedButton(
                      onPressed: isSaveButtonEnabled
                          ? () => appointments.createAppointment(
                              makeReservation(authProvider.user?.id ?? 0))
                          : null,
                      child: const Text('Make a reservation'))
                  : ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
