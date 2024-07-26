abstract class AuthenticationApi {
  Future<dynamic> login({
    required String username,
    required String password,
  });

  Future<String> refresh({required String refreshToken});
}
