import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Payment {
  int id;
  DateTime date;
  double amount;
  int userId;
  int treatmentId;
  String cardNumber;
  String client;
  String treatmentName;

  Payment(
    this.id,
    this.date,
    this.amount,
    this.userId,
    this.treatmentId,
    this.cardNumber,
    this.client,
    this.treatmentName,
  );
}
