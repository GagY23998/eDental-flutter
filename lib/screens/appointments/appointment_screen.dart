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
    'Monday',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun'
  ];
  // List<String> getListOfWeekDays(DateTime first, DateTime last){
  //   List<String> list = [];
  //   DateTime tempDate = first;
  //   int index = first.day;

  //   while(index++<=last.day){
  //     list.add(DateFormat('EEEE').format(tempDate));
  //     tempDate = tempDate.add(const Duration(days: 1));
  //   }
  //   return list;
  // FutureBuilder<List<Dentist>>(
  //   future:  dentists.getDentistDropdown(),
  //   builder: (context, snapshot){
  //   })

  // }

  Future pickDateRange(
      DateTimeRange? initialDateRange, DateTime firstDate) async {
    DateTimeRange? dateRange = await showDateRangePicker(
        context: context,
        initialDateRange: initialDateRange,
        firstDate: firstDate,
        lastDate: DateTime(DateTime.now().year, 12, 31));
    if (dateRange != null && dateRange.duration.inDays < 7) return;
    return dateRange;
  }

  @override
  Widget build(BuildContext context) {
    final appointments = Provider.of<AppointmentProvider>(context);
    final dentists = Provider.of<DentistProvider>(context, listen: false);
    final dentistList = dentists.getDentists();
    final deviceSize = MediaQuery.of(context).size;
    DateTime firstDate = appointments.firstDayOfWeek;
    DateTime lastDate = appointments.lastDayOfWeek;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          child: Column(children: [
            Row(children: [
              // DropdownButtonHideUnderline(
              //   child: FutureBuilder<List<Dentist>>(
              //     future: dentists.getDentistsAsync(),
              //     builder: (context, snapshot) {
              //       return DropdownButton(
              //           items: dentists.getDentistsDropdown(),
              //           onChanged: (val) {
              //             appointments.setDentistAppointments(dentistList
              //                 .firstWhere((element) => element.fullName == val)
              //                 .id);
              //           });
              //     },
              //   ),
              // ),
              ElevatedButton(
                  onPressed: () => pickDateRange(
                      appointments.weekRange, appointments.firstDayOfWeek),
                  child: Text(
                      '${DateFormat('dd.mm.yyyy').format(firstDate)}-${DateFormat('dd.mm.yyyy').format(lastDate)}'))
            ]),
            SizedBox(
              height: deviceSize.height / 2,
              width: deviceSize.width,
              child: ListView.builder(
                  itemBuilder: (context, index) => Text(weekDays[index]),
                  itemCount: 7),
            ),
            FutureBuilder(
              future: appointments.initializeValues(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: [
                      Column(children: [const Text('gagi test')]),
                      Column(children: [const Text('gagi test')]),
                      Column(children: [const Text('gagi test')]),
                      Column(children: [const Text('gagi test')]),
                      Column(children: [const Text('gagi test')]),
                      Column(children: [const Text('gagi test')]),
                      Column(children: [const Text('gagi test')]),
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            )
          ]),
        )
      ],
    ));
  }
}
