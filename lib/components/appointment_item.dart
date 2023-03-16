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
      // (
      // (appointment!.start.isBefore(appointmentHour) ||
      appointment!.start.isAtSameMomentAs(appointmentHour)
      // )
      /* &&
          (appointment!.end.isAfter(appointmentHour) ||
              appointment!.end.isAtSameMomentAs(appointmentHour)))*/
      ;
  @override
  State<AppointmentItem> createState() => _AppointmentItemState();
}

class _AppointmentItemState extends State<AppointmentItem> {
  @override
  Widget build(BuildContext context) {
    // final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 30,
      width: 55,
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.resolveWith(
                (states) => const EdgeInsets.all(0))),
        onPressed: () => showDialog(
          context: context,
          builder: (context) => FractionallySizedBox(
              heightFactor: 0.7,
              widthFactor: 1,
              child: AppointmentDetail(widget)),
        ),
        child: Text(
            style: TextStyle(
                color: Colors.white,
                backgroundColor:
                    widget.IsReserved ? Colors.red : Colors.green[600]),
            DateFormat('HH:mm').format(widget.appointmentHour)),
      ),
    );
  }
}
