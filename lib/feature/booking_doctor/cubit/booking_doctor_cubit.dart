import 'package:eclass/core/api/dio_config.dart';
import 'package:eclass/core/api/doctor/doctor_api_impl.dart';
import 'package:eclass/core/models/doctor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_doctor_cubit.freezed.dart';
part 'booking_doctor_state.dart';

class BookingDoctorCubit extends Cubit<BookingDoctorState> {
  final _bookingDoctorApi = DoctorApiImpl(DioConfig().dioCf);

  BookingDoctorCubit() : super(const BookingDoctorState());

  Future<dynamic> getDoctor(int? id) async {
    try {
      emit(state.copyWith(isLoading: true));

      if (id != null) {
        final Doctor? data = await _bookingDoctorApi.getDoctor(id: id);
        if (data != null) {
          emit(state.copyWith(doctor: data, isLoading: false));
        }
      }
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<void> findAllDoctors() async {
    try {
      emit(state.copyWith(isLoading: true));
      final data = await _bookingDoctorApi.findAll() as List<Doctor>;
      emit(state.copyWith(doctors: data, isLoading: false));
    } catch (e) {
      print(e);
      emit(state.copyWith(isLoading: false));
    }
  }
}
