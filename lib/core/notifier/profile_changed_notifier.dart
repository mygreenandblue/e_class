import 'package:flutter/material.dart';
import 'package:eclass/core/models/profile.dart';

class ProfileNotifier extends ChangeNotifier {
  Profile? _profile;

  Profile? get profile => _profile;

  void updateProfile(Profile profile) {
    _profile = profile;
    notifyListeners();
  }
}
