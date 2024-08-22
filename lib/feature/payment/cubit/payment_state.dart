part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    @Default(false) bool isLoading,
  }) = _PaymentState;
}
