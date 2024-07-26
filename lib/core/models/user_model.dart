// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  final int id;
  final String username;
  final String? firstName;
  final String? lastName;
  final String? emailName;
  final String? groups;

  const UserModel(
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.emailName,
    this.groups,
  );

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
