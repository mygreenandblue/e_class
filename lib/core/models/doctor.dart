// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Doctor {
  final int id;
  final int? user;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dateOfBirth;
  final String? gender;
  final String? emergencyContact;
  final bool? status;
  final String? position;
  final String? specialization;
  final String? image;
  final String? nationality;
  final String? phoneNumber;
  const Doctor({
    required this.id,
    this.user,
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.emergencyContact,
    this.status,
    this.position,
    this.specialization,
    this.image,
    this.nationality,
    this.phoneNumber,
  });

  Map<String, dynamic> toJson() => _$DoctorToJson(this);
  factory Doctor.fromJson(Map<String, dynamic> json) => _$DoctorFromJson(json);

  Doctor copyWith({
    int? id,
    int? user,
    String? firstName,
    String? lastName,
    String? email,
    String? dateOfBirth,
    String? gender,
    String? emergencyContact,
    bool? status,
    String? position,
    String? specialization,
    String? image,
    String? nationality,
    String? phoneNumber,
  }) {
    return Doctor(
      id: id ?? this.id,
      user: user ?? this.user,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      status: status ?? this.status,
      position: position ?? this.position,
      specialization: specialization ?? this.specialization,
      image: image ?? this.image,
      nationality: nationality ?? this.nationality,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
