part of 'address_cubit.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState({
    @Default([]) List<Map<String, dynamic>> provinces,
    @Default([]) List<Map<String, dynamic>> districts,
    @Default([]) List<Map<String, dynamic>> wards,
    @Default(false) bool isLoading,
  }) = _AddressState;
}
