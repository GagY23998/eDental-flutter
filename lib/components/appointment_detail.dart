import 'package:edental/models/appointment.dart';
import 'package:edental/models/dentist.dart';
import 'package:edental/models/treatment.dart';
import 'package:edental/providers/dentist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';
import '../providers/treatmentProvider.dart';
import 'appointment_item.dart';

class AppointmentDetail extends StatefulWidget {
  AppointmentDetail(this.appointmentItem, {super.key});
  final AppointmentItem appointmentItem;
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  @override
  State<AppointmentDetail> createState() => _AppointmentDetailState();
}

class _AppointmentDetailState extends State<AppointmentDetail> {
  int selectedDentistId = 0;
  int selectedTreatmentId = 0;
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context);
    final dentist = Provider.of<DentistProvider>(context);
    final treatment = Provider.of<TreatmentProvider>(context);
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: widget._startDateController,
            decoration: const InputDecoration(label: Text('Start date')),
            readOnly: widget.appointmentItem.IsReserved,
          ),
          TextFormField(
            controller: widget._endDateController,
            decoration: const InputDecoration(label: Text('End date')),
            readOnly: widget.appointmentItem.IsReserved,
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(label: Text('Dentist')),
            items: dentist.dentists
                .map((e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(e.fullName),
                    ))
                .toList(),
            onChanged: (value) => setState(() {
              selectedDentistId = value!;
            }),
          ),
          DropdownButtonFormField(
            decoration: const InputDecoration(label: Text('Treatment')),
            items: treatment
                .getTreatments()
                .map((e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(e.name),
                    ))
                .toList(),
            onChanged: (value) => setState(() {
              selectedTreatmentId = value!;
            }),
          ),
        ],
      ),
    );
  }
}
