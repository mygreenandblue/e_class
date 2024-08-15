// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      image: json['image'] as String?,
      cmnd: json['cmnd'] as String?,
      thebhyt: json['thebhyt'] as String?,
      address: json['address'] as String?,
      nation: json['nation'] as String?,
      nationality: json['nationality'] as String?,
      phoneNumber: json['phone_number'] as String?,
      email: json['email'] as String?,
      job: json['job'] as String?,
      emergencyContact: json['emergency_contact'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'image': instance.image,
      'cmnd': instance.cmnd,
      'thebhyt': instance.thebhyt,
      'address': instance.address,
      'nation': instance.nation,
      'nationality': instance.nationality,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'job': instance.job,
      'emergency_contact': instance.emergencyContact,
    };
