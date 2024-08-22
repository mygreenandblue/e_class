// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_doctor_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingDoctorState {
  List<Doctor>? get doctors => throw _privateConstructorUsedError;
  Doctor? get doctor => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of BookingDoctorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingDoctorStateCopyWith<BookingDoctorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingDoctorStateCopyWith<$Res> {
  factory $BookingDoctorStateCopyWith(
          BookingDoctorState value, $Res Function(BookingDoctorState) then) =
      _$BookingDoctorStateCopyWithImpl<$Res, BookingDoctorState>;
  @useResult
  $Res call({List<Doctor>? doctors, Doctor? doctor, bool isLoading});
}

/// @nodoc
class _$BookingDoctorStateCopyWithImpl<$Res, $Val extends BookingDoctorState>
    implements $BookingDoctorStateCopyWith<$Res> {
  _$BookingDoctorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BookingDoctorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = freezed,
    Object? doctor = freezed,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      doctors: freezed == doctors
          ? _value.doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Doctor>?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Doctor?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookingDoctorStateImplCopyWith<$Res>
    implements $BookingDoctorStateCopyWith<$Res> {
  factory _$$BookingDoctorStateImplCopyWith(_$BookingDoctorStateImpl value,
          $Res Function(_$BookingDoctorStateImpl) then) =
      __$$BookingDoctorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Doctor>? doctors, Doctor? doctor, bool isLoading});
}

/// @nodoc
class __$$BookingDoctorStateImplCopyWithImpl<$Res>
    extends _$BookingDoctorStateCopyWithImpl<$Res, _$BookingDoctorStateImpl>
    implements _$$BookingDoctorStateImplCopyWith<$Res> {
  __$$BookingDoctorStateImplCopyWithImpl(_$BookingDoctorStateImpl _value,
      $Res Function(_$BookingDoctorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of BookingDoctorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? doctors = freezed,
    Object? doctor = freezed,
    Object? isLoading = null,
  }) {
    return _then(_$BookingDoctorStateImpl(
      doctors: freezed == doctors
          ? _value._doctors
          : doctors // ignore: cast_nullable_to_non_nullable
              as List<Doctor>?,
      doctor: freezed == doctor
          ? _value.doctor
          : doctor // ignore: cast_nullable_to_non_nullable
              as Doctor?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$BookingDoctorStateImpl implements _BookingDoctorState {
  const _$BookingDoctorStateImpl(
      {final List<Doctor>? doctors, this.doctor, this.isLoading = false})
      : _doctors = doctors;

  final List<Doctor>? _doctors;
  @override
  List<Doctor>? get doctors {
    final value = _doctors;
    if (value == null) return null;
    if (_doctors is EqualUnmodifiableListView) return _doctors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Doctor? doctor;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'BookingDoctorState(doctors: $doctors, doctor: $doctor, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingDoctorStateImpl &&
            const DeepCollectionEquality().equals(other._doctors, _doctors) &&
            (identical(other.doctor, doctor) || other.doctor == doctor) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_doctors), doctor, isLoading);

  /// Create a copy of BookingDoctorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingDoctorStateImplCopyWith<_$BookingDoctorStateImpl> get copyWith =>
      __$$BookingDoctorStateImplCopyWithImpl<_$BookingDoctorStateImpl>(
          this, _$identity);
}

abstract class _BookingDoctorState implements BookingDoctorState {
  const factory _BookingDoctorState(
      {final List<Doctor>? doctors,
      final Doctor? doctor,
      final bool isLoading}) = _$BookingDoctorStateImpl;

  @override
  List<Doctor>? get doctors;
  @override
  Doctor? get doctor;
  @override
  bool get isLoading;

  /// Create a copy of BookingDoctorState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingDoctorStateImplCopyWith<_$BookingDoctorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
