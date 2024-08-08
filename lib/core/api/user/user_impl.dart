import 'package:dio/dio.dart';
import 'package:eclass/core/api/api_exception.dart';
import 'package:eclass/core/api/requet_utils.dart';
import 'package:eclass/core/api/user/user_api.dart';
import 'package:eclass/core/models/user_model.dart';

class UserApiImpl implements UserApi {
  final Dio client;

  UserApiImpl(this.client);

  @override
  Future getUser({required int userId}) async {
    final result = await getSingleResult(
      "/accounts/api/users/$userId/",
      UserModel.fromJson,
      ErrorCode.loadUserFail,
      client: client,
    );

    return result;
  }
}
