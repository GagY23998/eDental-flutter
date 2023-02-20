import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:edental/components/treatment_tile.dart';
import 'package:flutter/material.dart';
import 'package:edental/components/total_tile.dart';

class TreatmentScreen extends StatefulWidget {
  const TreatmentScreen({super.key});

  @override
  State<TreatmentScreen> createState() => _TreatmentScreenState();
}

class _TreatmentScreenState extends State<TreatmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Treatment history')),
      body: ListView(
        children: [
          TreatmentTile(
              isPaid: true,
              treatmentTitle: 'Vađenje zuba',
              doctorName: 'Harun Hodžić'),
          TreatmentTile(
              isPaid: false,
              treatmentTitle: 'Izbjeljivanje zuba',
              doctorName: 'Ahmed Gudić'),
          SizedBox(
            height: 50,
          ),
          TotalTile(),
        ],
      ),
    );
  }
}
