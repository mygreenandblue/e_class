import 'package:eclass/core/models/doctor.dart';

abstract class DoctorApi {
  Future<dynamic> getDoctor({required int id});
  Future<Iterable<Doctor>> findAll();
}
