// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressState {
  List<Map<String, dynamic>> get provinces =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get districts =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get wards => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressStateCopyWith<AddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressStateCopyWith<$Res> {
  factory $AddressStateCopyWith(
          AddressState value, $Res Function(AddressState) then) =
      _$AddressStateCopyWithImpl<$Res, AddressState>;
  @useResult
  $Res call(
      {List<Map<String, dynamic>> provinces,
      List<Map<String, dynamic>> districts,
      List<Map<String, dynamic>> wards,
      bool isLoading});
}

/// @nodoc
class _$AddressStateCopyWithImpl<$Res, $Val extends AddressState>
    implements $AddressStateCopyWith<$Res> {
  _$AddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinces = null,
    Object? districts = null,
    Object? wards = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      provinces: null == provinces
          ? _value.provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      districts: null == districts
          ? _value.districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      wards: null == wards
          ? _value.wards
          : wards // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressStateImplCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory _$$AddressStateImplCopyWith(
          _$AddressStateImpl value, $Res Function(_$AddressStateImpl) then) =
      __$$AddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<String, dynamic>> provinces,
      List<Map<String, dynamic>> districts,
      List<Map<String, dynamic>> wards,
      bool isLoading});
}

/// @nodoc
class __$$AddressStateImplCopyWithImpl<$Res>
    extends _$AddressStateCopyWithImpl<$Res, _$AddressStateImpl>
    implements _$$AddressStateImplCopyWith<$Res> {
  __$$AddressStateImplCopyWithImpl(
      _$AddressStateImpl _value, $Res Function(_$AddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? provinces = null,
    Object? districts = null,
    Object? wards = null,
    Object? isLoading = null,
  }) {
    return _then(_$AddressStateImpl(
      provinces: null == provinces
          ? _value._provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      districts: null == districts
          ? _value._districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      wards: null == wards
          ? _value._wards
          : wards // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddressStateImpl implements _AddressState {
  const _$AddressStateImpl(
      {final List<Map<String, dynamic>> provinces = const [],
      final List<Map<String, dynamic>> districts = const [],
      final List<Map<String, dynamic>> wards = const [],
      this.isLoading = false})
      : _provinces = provinces,
        _districts = districts,
        _wards = wards;

  final List<Map<String, dynamic>> _provinces;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get provinces {
    if (_provinces is EqualUnmodifiableListView) return _provinces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_provinces);
  }

  final List<Map<String, dynamic>> _districts;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get districts {
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_districts);
  }

  final List<Map<String, dynamic>> _wards;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get wards {
    if (_wards is EqualUnmodifiableListView) return _wards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_wards);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AddressState(provinces: $provinces, districts: $districts, wards: $wards, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressStateImpl &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces) &&
            const DeepCollectionEquality()
                .equals(other._districts, _districts) &&
            const DeepCollectionEquality().equals(other._wards, _wards) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_provinces),
      const DeepCollectionEquality().hash(_districts),
      const DeepCollectionEquality().hash(_wards),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      __$$AddressStateImplCopyWithImpl<_$AddressStateImpl>(this, _$identity);
}

abstract class _AddressState implements AddressState {
  const factory _AddressState(
      {final List<Map<String, dynamic>> provinces,
      final List<Map<String, dynamic>> districts,
      final List<Map<String, dynamic>> wards,
      final bool isLoading}) = _$AddressStateImpl;

  @override
  List<Map<String, dynamic>> get provinces;
  @override
  List<Map<String, dynamic>> get districts;
  @override
  List<Map<String, dynamic>> get wards;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$AddressStateImplCopyWith<_$AddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
