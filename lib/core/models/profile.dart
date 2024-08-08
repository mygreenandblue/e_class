// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Profile {
  int? id;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? gender;
  String? image;
  String? cmnd;
  String? thebhyt;
  String? address;
  String? nation;
  String? nationality;
  String? phoneNumber;
  String? email;
  String? job;
  String? emergencyContact;
  Profile({
    required this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.image,
    this.cmnd,
    this.thebhyt,
    this.address,
    this.nation,
    this.nationality,
    this.phoneNumber,
    this.email,
    this.job,
    this.emergencyContact,
  });

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Profile copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    String? gender,
    String? image,
    String? cmnd,
    String? thebhyt,
    String? address,
    String? nation,
    String? nationality,
    String? phoneNumber,
    String? email,
    String? job,
    String? emergencyContact,
  }) {
    return Profile(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      cmnd: cmnd ?? this.cmnd,
      thebhyt: thebhyt ?? this.thebhyt,
      address: address ?? this.address,
      nation: nation ?? this.nation,
      nationality: nationality ?? this.nationality,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      job: job ?? this.job,
      emergencyContact: emergencyContact ?? this.emergencyContact,
    );
  }
}
