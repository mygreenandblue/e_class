import 'package:eclass/core/models/booking_time.dart';

abstract class BookingTimeApi {
  Future<Iterable<BookingTime>> findAll(int doctorId, String date);
}
