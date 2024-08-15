// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Doctor {
  final int id;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? dateOfBirth;
  final String? gender;
  final String? emergencyContact;
  final bool? status;
  final String? position;
  final String? specialization;
  Doctor({
    required this.id,
    required this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.emergencyContact,
    this.status,
    this.position,
    this.specialization,
  });

  Doctor copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? dateOfBirth,
    String? gender,
    String? emergencyContact,
    bool? status,
    String? position,
    String? specialization,
  }) {
    return Doctor(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      emergencyContact: emergencyContact ?? this.emergencyContact,
      status: status ?? this.status,
      position: position ?? this.position,
      specialization: specialization ?? this.specialization,
    );
  }
}
