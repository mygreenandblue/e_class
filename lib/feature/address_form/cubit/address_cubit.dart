import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_cubit.freezed.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  final Dio _dio = Dio();

  AddressCubit() : super(const AddressState());

  Future<void> fetchProvinces() async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _dio.get('https://vapi.vnappmob.com/api/province');
      emit(state.copyWith(
          provinces: List<Map<String, dynamic>>.from(response.data['results']),
          isLoading: false));
    } catch (error) {
      // Handle error
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchDistricts(String provinceId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _dio
          .get('https://vapi.vnappmob.com/api/province/district/$provinceId');
      emit(state.copyWith(
          districts: List<Map<String, dynamic>>.from(response.data['results']),
          isLoading: false));
    } catch (error) {
      // Handle error
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> fetchWards(String districtId) async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await _dio
          .get('https://vapi.vnappmob.com/api/province/ward/$districtId');
      emit(state.copyWith(
          wards: List<Map<String, dynamic>>.from(response.data['results']),
          isLoading: false));
    } catch (error) {
      // Handle error
      emit(state.copyWith(isLoading: false));
    }
  }
}
