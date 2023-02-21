import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TreatmentTile extends StatelessWidget {
  TreatmentTile(
      {required this.isPaid,
      required this.treatmentTitle,
      required this.doctorName});
  bool isPaid;
  String treatmentTitle;
  String doctorName;
  Color status = Colors.grey;
  Color statusPaid = Colors.greenAccent;
  Color statusUnpaid = Colors.redAccent;
  final DateTime treatmentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RatingBar.builder(
            initialRating: 3,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
              size: 2,
            ),
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
      title: Text(treatmentTitle),
      subtitle: Text('$doctorName - $treatmentDate'),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.payment,
                color: isPaid ? statusUnpaid : statusPaid,
              ),
            ],
          )
        ],
      ),
    );
  }
}
