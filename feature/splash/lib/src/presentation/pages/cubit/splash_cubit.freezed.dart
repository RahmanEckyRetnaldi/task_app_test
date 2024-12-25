// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SplashState {
  FormzStatus get getSplashStatus => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  SplashEvent? get splashEvent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SplashStateCopyWith<SplashState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) then) =
      _$SplashStateCopyWithImpl<$Res, SplashState>;
  @useResult
  $Res call(
      {FormzStatus getSplashStatus,
      Failure? failure,
      SplashEvent? splashEvent});
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getSplashStatus = null,
    Object? failure = freezed,
    Object? splashEvent = freezed,
  }) {
    return _then(_value.copyWith(
      getSplashStatus: null == getSplashStatus
          ? _value.getSplashStatus
          : getSplashStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      splashEvent: freezed == splashEvent
          ? _value.splashEvent
          : splashEvent // ignore: cast_nullable_to_non_nullable
              as SplashEvent?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SplashStateImplCopyWith<$Res>
    implements $SplashStateCopyWith<$Res> {
  factory _$$SplashStateImplCopyWith(
          _$SplashStateImpl value, $Res Function(_$SplashStateImpl) then) =
      __$$SplashStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus getSplashStatus,
      Failure? failure,
      SplashEvent? splashEvent});
}

/// @nodoc
class __$$SplashStateImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashStateImpl>
    implements _$$SplashStateImplCopyWith<$Res> {
  __$$SplashStateImplCopyWithImpl(
      _$SplashStateImpl _value, $Res Function(_$SplashStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getSplashStatus = null,
    Object? failure = freezed,
    Object? splashEvent = freezed,
  }) {
    return _then(_$SplashStateImpl(
      getSplashStatus: null == getSplashStatus
          ? _value.getSplashStatus
          : getSplashStatus // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      splashEvent: freezed == splashEvent
          ? _value.splashEvent
          : splashEvent // ignore: cast_nullable_to_non_nullable
              as SplashEvent?,
    ));
  }
}

/// @nodoc

class _$SplashStateImpl extends _SplashState {
  const _$SplashStateImpl(
      {this.getSplashStatus = FormzStatus.pure, this.failure, this.splashEvent})
      : super._();

  @override
  @JsonKey()
  final FormzStatus getSplashStatus;
  @override
  final Failure? failure;
  @override
  final SplashEvent? splashEvent;

  @override
  String toString() {
    return 'SplashState(getSplashStatus: $getSplashStatus, failure: $failure, splashEvent: $splashEvent)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashStateImplCopyWith<_$SplashStateImpl> get copyWith =>
      __$$SplashStateImplCopyWithImpl<_$SplashStateImpl>(this, _$identity);
}

abstract class _SplashState extends SplashState {
  const factory _SplashState(
      {final FormzStatus getSplashStatus,
      final Failure? failure,
      final SplashEvent? splashEvent}) = _$SplashStateImpl;
  const _SplashState._() : super._();

  @override
  FormzStatus get getSplashStatus;
  @override
  Failure? get failure;
  @override
  SplashEvent? get splashEvent;
  @override
  @JsonKey(ignore: true)
  _$$SplashStateImplCopyWith<_$SplashStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
