// ignore_for_file: avoid_print

import 'package:eclass/core/api/booking_time/booking_time_impl.dart';
import 'package:eclass/core/api/dio_config.dart';
import 'package:eclass/core/models/booking_time.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'booking_calendar_state.dart';

class BookingCalendarCubit extends Cubit<BookingCalendarState> {
  final _api = BookingTimeApiImpl(DioConfig().dioCf);

  BookingCalendarCubit() : super(BookingCalendarInitial());

  Future<void> findAll(int? id, String? date) async {
    try {
      emit(BookingCalendarLoading());
      if (id != null) {
        final data = await _api.findAll(id, date ?? '') as List<BookingTime>;

        emit(Loaded(bookingTimes: data));
      } else {
        emit(const BookingCalendarError(message: 'Load fail'));
      }
    } catch (e) {
      emit(BookingCalendarError(message: e.toString()));
    }
  }
}
