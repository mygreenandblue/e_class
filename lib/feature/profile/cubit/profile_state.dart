part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    Profile? profile,
    @Default(false) bool isLoading,
  }) = _ProfileState;
}
