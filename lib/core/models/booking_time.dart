// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_time.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BookingTime {
  final String? time;
  final String? status;
  const BookingTime({
    this.time,
    this.status,
  });

  Map<String, dynamic> toJson() => _$BookingTimeToJson(this);
  factory BookingTime.fromJson(Map<String, dynamic> json) =>
      _$BookingTimeFromJson(json);
}

class BookingDetail {
  final String valueDate;
  final String valueTime;
  final int keyIdDoctor;
  final String medicalService;
  final String name;
  final String symptomText;
  BookingDetail({
    required this.valueDate,
    required this.valueTime,
    required this.keyIdDoctor,
    required this.medicalService,
    required this.symptomText,
    required this.name,
  });
}
