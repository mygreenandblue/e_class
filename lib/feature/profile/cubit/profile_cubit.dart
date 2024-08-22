import 'package:eclass/core/api/dio_config.dart';
import 'package:eclass/core/api/profile/profile_api_impl.dart';
import 'package:eclass/core/local/auth_local.dart';
import 'package:eclass/core/models/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final _profileApi = ProfileApiImpl(DioConfig().dioCf);

  ProfileCubit() : super(const ProfileState());

  Future<void> getProfile() async {
    try {
      emit(state.copyWith(isLoading: true));
      final id = await AuthLocal.getUserId();
      if (id != null) {
        final Profile? data = await _profileApi.getProfile(id);
        if (data != null) {
          emit(state.copyWith(profile: data, isLoading: false));
        }
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<dynamic> updateProfile(Profile profile) async {
    if (profile.id != null) {
      try {
        emit(state.copyWith(isLoading: true));
        final Profile data = await _profileApi.updateProfile(profile);
        emit(state.copyWith(profile: data, isLoading: false));
      } catch (e) {
        print(e);
        emit(state.copyWith(isLoading: false));
      }
    }
  }
}
