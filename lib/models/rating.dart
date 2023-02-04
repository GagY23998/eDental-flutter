import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Rating {
  int id;
  int rate;
  String comment;
  DateTime date;
  int userId;
  int dentistId;
  String dentistFullName;
  String clientFullName;

  Rating(
    this.id,
    this.rate,
    this.comment,
    this.date,
    this.userId,
    this.dentistId,
    this.dentistFullName,
    this.clientFullName,
  );
}
