import 'package:eclass/core/api/dio_config.dart';
import 'package:eclass/core/api/profile/profile_impl.dart';
import 'package:eclass/core/models/profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final _profileApi = ProfileApiImpl(DioConfig().dioCf);

  ProfileCubit() : super(const ProfileState());

  Future<void> getProfile(int? id) async {
    try {
      emit(state.copyWith(isLoading: true));

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

  Future<void> creaateProfile(Profile profile) async {
    try {
      emit(state.copyWith(isLoading: true));
      final Profile data = await _profileApi.createProfile(profile);
      emit(state.copyWith(profile: data, isLoading: false));
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false));
    }
  }
}
