import 'package:dio/dio.dart';
import 'package:eclass/core/api/dio_config.dart';

import 'package:eclass/core/local/image_local.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final _client = DioConfig().dioCf;

  PaymentCubit() : super(const PaymentState());

  Future<bool> payment(
      int userId,
      int doctorId,
      String? symptomText,
      String valueDate,
      String vlueTime,
      String medicalService,
      String? filePath) async {
    try {
      emit(state.copyWith(isLoading: true));

      final formData = FormData.fromMap({
        'key_id_doctor': doctorId,
        'medical_service': medicalService,
        'symptom_text': symptomText,
        'user_id ': userId,
        'value_date': valueDate,
        'value_time': vlueTime,
        'fileName': filePath == null
            ? null
            : await MultipartFile.fromFile(filePath, filename: 'upload.jpg'),
      });
      final response =
          await _client.post('/clinic_manager/appointments/', data: formData);
      if (response.statusCode == 201) {
        await deleteAllSavedImages();
        emit(state.copyWith(
          isLoading: false,
        ));
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      emit(state.copyWith(
        isLoading: false,
      ));
      return false;
    }
  }
}
