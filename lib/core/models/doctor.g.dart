// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Doctor _$DoctorFromJson(Map<String, dynamic> json) => Doctor(
      id: (json['id'] as num).toInt(),
      user: (json['user'] as num?)?.toInt(),
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      gender: json['gender'] as String?,
      emergencyContact: json['emergency_contact'] as String?,
      status: json['status'] as bool?,
      position: json['position'] as String?,
      specialization: json['specialization'] as String?,
      image: json['image'] as String?,
      nationality: json['nationality'] as String?,
      phoneNumber: json['phone_number'] as String?,
    );

Map<String, dynamic> _$DoctorToJson(Doctor instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'emergency_contact': instance.emergencyContact,
      'status': instance.status,
      'position': instance.position,
      'specialization': instance.specialization,
      'image': instance.image,
      'nationality': instance.nationality,
      'phone_number': instance.phoneNumber,
    };
