// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Profile {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final String? gender;
  final String? image;
  final String? cmnd;
  final String? thebhyt;
  final String? currentAddress;
  final String? address;
  final String? nation;
  final String? nationality;
  final String? phoneNumber;
  final String? email;
  final String? job;
  final String? emergencyContact;
  const Profile({
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
    this.currentAddress,
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
    String? currentAddress,
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
      currentAddress: currentAddress ?? this.currentAddress,
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
