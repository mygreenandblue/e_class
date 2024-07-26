import 'package:eclass/core/api/auth/auth_impl.dart';
import 'package:eclass/core/local/auth_local.dart';
import 'package:eclass/core/api/dio_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final authApi = AuthenticationApiImpl(DioConfig().dioCf);
  AuthCubit() : super(AuthInitial());

  Future<void> login(String username, String password) async {
    try {
      emit(AuthLoading());
      final data = await authApi.login(username: username, password: password);
      final accessToken = data['access'];
      final refreshToken = data['refresh'];
      Map<String, dynamic> decodedToken = JwtDecoder.decode(accessToken);
      final userId = decodedToken['user_id'];
      await AuthLocal.setUserId(userId);
      await AuthLocal.setAccessToken(accessToken);
      await AuthLocal.setRefreshToken(refreshToken);
      emit(Authenticated(token: accessToken));
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> logout() async {
    await AuthLocal.deleteAccessToken();
    await AuthLocal.deleteRefreshToken();
    await AuthLocal.deleteUserId();
    emit(UnAuthenticated());
  }

  bool isTokenExpired(String token) {
    try {
      return JwtDecoder.isExpired(token);
    } catch (e) {
      return true;
    }
  }
}
