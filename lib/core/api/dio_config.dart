// DioConfig.dart
import 'package:dio/dio.dart';
import 'package:eclass/core/local/auth_local.dart';
import 'package:eclass/core/api/base_url.dart';
import 'package:eclass/feature/login/cubit/auth_cubit.dart';

class DioConfig {
  Dio get dioCf {
    final dio = Dio(
      BaseOptions(
        baseUrl: BaseUrl.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!options.path.startsWith("http")) {
            options.path = BaseUrl.baseUrl + options.path;
          }
          final accessToken = await AuthLocal.getAccessToken();
          if (accessToken != null) {
            options.headers['Authorization'] = "Bearer $accessToken";
          }
          options.headers['Accept'] = "application/json";
          return handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == 401) {
            try {
              await refreshToken();
              final retryRequest = await _retry(error.requestOptions);
              return handler.resolve(retryRequest);
            } catch (e) {
              AuthCubit().logout();
            }
          }
          return handler.next(error);
        },
      ),
    );

    return dio;
  }

  Future<void> refreshToken() async {
    final refreshToken = await AuthLocal.getRefreshToken();
    if (refreshToken != null) {
      try {
        final response = await dioCf.post(
          "/user/api/token/refresh/",
          data: {"refresh": refreshToken},
        );
        if (response.statusCode == 200) {
          final accessToken = response.data["access"];
          await AuthLocal.setAccessToken(accessToken);
          await AuthLocal.setRefreshToken(refreshToken);
        }
      } catch (e) {
        AuthCubit().logout();
      }
    } else {
      AuthCubit().logout();
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return dioCf.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
