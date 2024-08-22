import 'package:dio/dio.dart';
import 'package:eclass/core/api/api_exception.dart';
import 'package:eclass/core/api/doctor/doctor_api.dart';
import 'package:eclass/core/api/requet_utils.dart';
import 'package:eclass/core/models/doctor.dart';

class DoctorApiImpl implements DoctorApi {
  final Dio _client;

  DoctorApiImpl(this._client);

  @override
  Future<Iterable<Doctor>> findAll() async {
    final result = await getCollection(
      "/clinic_manager/get-doctors?page_size=10000",
      Doctor.fromJson,
      ErrorCode.loadDoctorFail,
      client: _client,
    );

    return result;
  }

  @override
  Future getDoctor({required int id}) async {
    final result = await getSingleResult(
      "/clinic_manager/get-doctors/$id/",
      Doctor.fromJson,
      ErrorCode.loadDoctorFail,
      client: _client,
    );

    return result;
  }
}
