import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eclass/core/api/api_exception.dart';
import 'package:eclass/core/api/requet_utils.dart';
import 'package:eclass/core/extensions/dio_extention.dart';
import 'package:eclass/core/models/profile.dart';

import 'profile_api.dart';

class ProfileApiImpl implements ProfileApi {
  final Dio _client;

  ProfileApiImpl(this._client);

  @override
  Future<Profile> createProfile(Profile profile) async {
    try {
      print(profile.toJson());
      final response = await _client.post(
        '/clinic_manager/patients/',
        data: profile.toJson(),
        options: Options(validateStatus: (status) => status == 201),
      );
      return Profile.fromJson(response.data);
    } on DioException catch (exception) {
      throw exception.unravel(
        orElse: const ApiException(
          ErrorCode.createProfileFail,
        ),
      );
    }
  }

  @override
  Future<Profile?> getProfile(int id) async {
    return getSingleResult(
      "/clinic_manager/patients/$id",
      Profile.fromJson,
      ErrorCode.loadProfileFail,
      client: _client,
    );
  }

  @override
  Future<Profile> updateProfile(Profile profile) async {
    try {
      final response = await _client.put(
        '/clinic_manager/patients/${profile.id}/',
        data: json.encode(profile.toJson()),
        options: Options(validateStatus: (status) => status == 200),
      );
      return Profile.fromJson(response.data);
    } on DioException catch (exception) {
      throw exception.unravel(
        orElse: const ApiException(
          ErrorCode.updateProfileFail,
        ),
      );
    }
  }
}
