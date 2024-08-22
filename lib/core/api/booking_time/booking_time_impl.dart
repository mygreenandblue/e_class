import 'package:dio/dio.dart';
import 'package:eclass/core/api/api_exception.dart';
import 'package:eclass/core/api/booking_time/booking_time_api.dart';
import 'package:eclass/core/api/requet_utils.dart';
import 'package:eclass/core/models/booking_time.dart';

class BookingTimeApiImpl extends BookingTimeApi {
  final Dio _client;

  BookingTimeApiImpl(this._client);
  @override
  Future<Iterable<BookingTime>> findAll(int doctorId, String date) async {
    final result = await getDataTimeCollections(
      "/clinic_manager/times?doctor_id=$doctorId&date=$date",
      BookingTime.fromJson,
      ErrorCode.loadBookingTimeFail,
      client: _client,
    );

    return result;
  }
}
