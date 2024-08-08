// ignore_for_file: avoid_print

import 'package:eclass/core/api/dio_config.dart';
import 'package:eclass/core/api/user/user_impl.dart';
import 'package:eclass/core/local/auth_local.dart';
import 'package:eclass/core/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final userApi = UserApiImpl(DioConfig().dioCf);
  List<UserModel> allUsers = [];
  HomeCubit() : super(HomeInitial());

  Future<void> getUser() async {
    try {
      emit(HomeLoading());
      final userId = await AuthLocal.getUserId();
      if (userId != null) {
        final UserModel data = await userApi.getUser(userId: userId);
        final userModel = data;
        emit(Loaded(userModel: userModel));
      } else {
        emit(const HomeError(message: 'Load fail'));
      }
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> getlistUser(int? id) async {
    try {
      emit(HomeLoading());
      if (id != null) {
        final data = await userApi.getUser(userId: id);
        print(data);
        allUsers = data;
        emit(GetListUser(userModels: data));
      } else {
        emit(const HomeError(message: 'Load fail'));
      }
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  List<UserModel> searchUsers(String query) {
    if (query.isEmpty) {
      return [];
    }

    final searchResults = allUsers.where((user) {
      final userNameLower = user.username.toLowerCase();
      final searchLower = query.toLowerCase();
      return userNameLower.contains(searchLower);
    }).toList();

    return searchResults;
  }
}
