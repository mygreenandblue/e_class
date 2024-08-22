part of 'booking_calendar_cubit.dart';

class BookingCalendarState {
  const BookingCalendarState();
  bool get isLoaded => switch (this) { Loaded() => true, _ => false };
}

class BookingCalendarInitial extends BookingCalendarState {}

class BookingCalendarLoading extends BookingCalendarState {}

class Loaded extends BookingCalendarState with EquatableMixin {
  final List<BookingTime> bookingTimes;

  Loaded({required this.bookingTimes});

  @override
  List<Object?> get props => [bookingTimes];
}

class UnLoaded extends BookingCalendarState {}

class BookingCalendarError extends BookingCalendarState {
  final String message;

  const BookingCalendarError({required this.message});
}
