import 'package:dart_json_mapper/dart_json_mapper.dart';

class CustomDateTimeConverter implements ICustomConverter<DateTime> {
  const CustomDateTimeConverter() : super();

  @override
  DateTime fromJSON(dynamic jsonValue, DeserializationContext context) {
    return DateTime.parse(jsonValue);
  }

  @override
  dynamic toJSON(DateTime object, SerializationContext context) {
    return object.toIso8601String();
  }
}
