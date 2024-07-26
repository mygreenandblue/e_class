// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      (json['id'] as num).toInt(),
      json['username'] as String,
      json['first_name'] as String?,
      json['last_name'] as String?,
      json['email_name'] as String?,
      json['groups'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email_name': instance.emailName,
      'groups': instance.groups,
    };
