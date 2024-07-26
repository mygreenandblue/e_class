import 'package:shared_preferences/shared_preferences.dart';

class AuthLocal {
  static const String _accessToken = "access";
  static const String _refreshToken = "refresh";
  static const String _phone = "phone";
  static const String _userId = "user_id";

  static late SharedPreferences sharedPreferences;
  static Future init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setAccessToken(String token) async {
    await sharedPreferences.setString(_accessToken, token);
  }

  static Future<String?> getAccessToken() async {
    return sharedPreferences.getString(_accessToken);
  }

  static Future<String?> deleteAccessToken() async {
    await sharedPreferences.remove(_accessToken);
    return null;
  }

  static Future setRefreshToken(String token) async {
    await sharedPreferences.setString(_refreshToken, token);
  }

  static Future<String?> getRefreshToken() async {
    return sharedPreferences.getString(_refreshToken);
  }

  static Future<String?> deleteRefreshToken() async {
    await sharedPreferences.remove(_refreshToken);
    return null;
  }

  static Future setPhone(String phone) async {
    await sharedPreferences.setString(_phone, phone);
  }

  static Future<String?> getPhone() async {
    return sharedPreferences.getString(_phone);
  }

  static Future<String?> deletePhone() async {
    await sharedPreferences.remove(_phone);
    return null;
  }

  static Future setUserId(int userId) async {
    await sharedPreferences.setInt(_userId, userId);
  }

  static Future<int?> getUserId() async {
    return sharedPreferences.getInt(_userId);
  }

  static Future<int?> deleteUserId() async {
    await sharedPreferences.remove(_userId);
    return null;
  }
}
