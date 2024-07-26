import 'package:dio/dio.dart';
import 'package:eclass/core/api/api_exception.dart';
import 'package:eclass/core/api/auth/auth.dart';
import 'package:eclass/core/extensions/dio_extention.dart';

class AuthenticationApiImpl implements AuthenticationApi {
  final Dio client;

  AuthenticationApiImpl(this.client);

  @override
  Future<dynamic> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await client.post(
        "/user/api/token/",
        data: {
          "username": username,
          "password": password,
        },
        options: Options(
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          followRedirects: false,
          headers: {
            "Accept": "application/json",
          },
        ),
      );

      return response.data;
    } on DioException catch (exception) {
      throw exception.unravel();
    } catch (error, stackTrace) {
      throw ApiException.unknown(
        details: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<String> refresh({required String refreshToken}) async {
    try {
      final response = await client.post(
        "/user/api/token/",
        data: {
          "refresh": refreshToken,
        },
        options: Options(
          sendTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          followRedirects: false,
          headers: {
            "Accept": "application/json",
          },
        ),
      );

      return response.data['access'];
    } on DioException catch (exception) {
      throw exception.unravel();
    } catch (error, stackTrace) {
      throw ApiException.unknown(
        details: error.toString(),
        stackTrace: stackTrace,
      );
    }
  }
}
