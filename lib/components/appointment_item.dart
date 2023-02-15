import 'package:edental/components/appointment_detail.dart';
import 'package:edental/models/appointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class AppointmentItem extends StatefulWidget {
  const AppointmentItem(
      {super.key, this.appointment, required this.appointmentHour});
  final DateTime appointmentHour;
  final Appointment? appointment;
  // ignore: non_constant_identifier_names
  bool get IsReserved =>
      appointment != null &&
      appointment?.start != null &&
      appointment?.end != null &&
      ((appointment!.start.isBefore(appointmentHour) ||
              appointment!.start.isAtSameMomentAs(appointmentHour)) &&
          (appointment!.end.isAfter(appointmentHour) ||
              appointment!.end.isAtSameMomentAs(appointmentHour)));
  @override
  State<AppointmentItem> createState() => _AppointmentItemState();
}

class _AppointmentItemState extends State<AppointmentItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 35,
      child: ElevatedButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) =>
              AppointmentDetail(widget), //hendlirati kad je reserved
          // da samo prikaze a kad nije da prebaci na rezervaciju
        ),
        child: Text(
            style: TextStyle(
                backgroundColor:
                    widget.IsReserved ? Colors.red : Colors.green[600]),
            DateFormat('H:mm').format(widget.appointmentHour)),
      ),
    );
  }
}
