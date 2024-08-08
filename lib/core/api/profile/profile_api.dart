import 'package:eclass/core/models/profile.dart';

abstract class ProfileApi {
  Future<Profile?> getProfile(int userId);
  Future<Profile> updateProfile(Profile profile);
  Future<Profile> createProfile(Profile profile);
}
