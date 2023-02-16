import 'package:edental/models/dentist.dart';
import 'package:edental/providers/appointmentProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../providers/dentist.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  final List<String> weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future pickDateRange(
      DateTimeRange? initialDateRange, DateTime firstDate) async {
    DateTimeRange? dateRange = await showDateRangePicker(
        context: context,
        initialDateRange: initialDateRange,
        firstDate: firstDate,
        cancelText: 'Close',
        lastDate: DateTime(DateTime.now().year, 12, 31));
    if (dateRange != null && dateRange.duration.inDays != 6) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 5),
          content: Text('Range has to be a week')));
      return;
    }
    if (dateRange?.start.weekday != 1 && dateRange?.end.weekday != 7) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 5),
          content: Text('Please choose dates between monday and sunday')));
      return;
    }

    return dateRange;
  }

  @override
  Widget build(BuildContext context) {
    // final appointments = Provider.of<AppointmentProvider>(context);
    final dentists = Provider.of<DentistProvider>(context, listen: false);
    final dentistList = dentists.getDentists();
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<AppointmentProvider>(
              builder: (context, appointments, child) => Container(
                child: Column(children: [
                  Row(children: [
                    DropdownButtonHideUnderline(
                      child: FutureBuilder<List<Dentist>>(
                        future: dentists.getDentistsAsync(),
                        builder: (context, snapshot) {
                          return DropdownButton(
                              items: dentists.getDentistsDropdown(),
                              onChanged: (val) {
                                appointments.setDentistAppointments(dentistList
                                    .firstWhere(
                                        (element) => element.fullName == val)
                                    .id);
                              });
                        },
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () => pickDateRange(
                              appointments.weekRange,
                              DateTime.now().add(
                                  Duration(days: DateTime.now().weekday - 1)))
                          .then((value) {
                        if (value != null) {
                          appointments.setWeekDaysFromRange(value);
                        }
                      }),
                      child: Consumer<AppointmentProvider>(
                        builder: (context, value, child) => Text(
                            '${DateFormat('dd.MM.yyyy').format(value.firstDayOfWeek)}-${DateFormat('dd.MM.yyyy').format(value.lastDayOfWeek)}'),
                      ),
                    )
                  ]),
                  SizedBox(
                      height: deviceSize.height / 8,
                      width: deviceSize.width,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: weekDays.map((e) => Text(e)).toList())),
                  FutureBuilder(
                    future: appointments.calculateAppointmentsForWeek(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Widget>? appointments =
                            snapshot.data?.entries.map((e) {
                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: e.value);
                        }).toList();
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: appointments ?? []);
                      }
                      return const CircularProgressIndicator();
                    },
                  )
                ]),
              ),
            )
          ],
        ));
  }
}
