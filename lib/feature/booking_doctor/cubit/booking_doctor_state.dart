part of 'booking_doctor_cubit.dart';

@freezed
class BookingDoctorState with _$BookingDoctorState {
  const factory BookingDoctorState({
    List<Doctor>? doctors,
    Doctor? doctor,
    @Default(false) bool isLoading,
  }) = _BookingDoctorState;
}
