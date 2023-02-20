import 'package:edental/components/treatment_tile.dart';
import 'package:flutter/material.dart';

class TotalTile extends StatefulWidget {
  TotalTile({super.key});
  List<TreatmentTile> paidReceipts = [];
  List<TreatmentTile> unpaidReceipts = [];
  List<TreatmentTile> totalReceipts = [];

  @override
  State<TotalTile> createState() => _TotalTileState();
}

class _TotalTileState extends State<TotalTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text('Paid Receipts'),
            SizedBox(height: 8),
          ],
        ),
        Column(
          children: [
            Text('Unpaid Receipts'),
            SizedBox(height: 8),
          ],
        ),
        Column(
          children: [
            Text('Total Receipts'),
            SizedBox(height: 8),
          ],
        ),
      ],
    );
  }
}
