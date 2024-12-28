// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskResponseModel _$TaskResponseModelFromJson(Map<String, dynamic> json) {
  return _TaskResponseModel.fromJson(json);
}

/// @nodoc
mixin _$TaskResponseModel {
  @JsonKey(name: 'page')
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int? get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int? get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<TaskDataModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskResponseModelCopyWith<TaskResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskResponseModelCopyWith<$Res> {
  factory $TaskResponseModelCopyWith(
          TaskResponseModel value, $Res Function(TaskResponseModel) then) =
      _$TaskResponseModelCopyWithImpl<$Res, TaskResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int? page,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'total_pages') int? totalPages,
      @JsonKey(name: 'data') List<TaskDataModel>? data});
}

/// @nodoc
class _$TaskResponseModelCopyWithImpl<$Res, $Val extends TaskResponseModel>
    implements $TaskResponseModelCopyWith<$Res> {
  _$TaskResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TaskDataModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskResponseModelImplCopyWith<$Res>
    implements $TaskResponseModelCopyWith<$Res> {
  factory _$$TaskResponseModelImplCopyWith(_$TaskResponseModelImpl value,
          $Res Function(_$TaskResponseModelImpl) then) =
      __$$TaskResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'page') int? page,
      @JsonKey(name: 'per_page') int? perPage,
      @JsonKey(name: 'total') int? total,
      @JsonKey(name: 'total_pages') int? totalPages,
      @JsonKey(name: 'data') List<TaskDataModel>? data});
}

/// @nodoc
class __$$TaskResponseModelImplCopyWithImpl<$Res>
    extends _$TaskResponseModelCopyWithImpl<$Res, _$TaskResponseModelImpl>
    implements _$$TaskResponseModelImplCopyWith<$Res> {
  __$$TaskResponseModelImplCopyWithImpl(_$TaskResponseModelImpl _value,
      $Res Function(_$TaskResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? perPage = freezed,
    Object? total = freezed,
    Object? totalPages = freezed,
    Object? data = freezed,
  }) {
    return _then(_$TaskResponseModelImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      perPage: freezed == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<TaskDataModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskResponseModelImpl implements _TaskResponseModel {
  const _$TaskResponseModelImpl(
      {@JsonKey(name: 'page') this.page,
      @JsonKey(name: 'per_page') this.perPage,
      @JsonKey(name: 'total') this.total,
      @JsonKey(name: 'total_pages') this.totalPages,
      @JsonKey(name: 'data') final List<TaskDataModel>? data})
      : _data = data;

  factory _$TaskResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'page')
  final int? page;
  @override
  @JsonKey(name: 'per_page')
  final int? perPage;
  @override
  @JsonKey(name: 'total')
  final int? total;
  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  final List<TaskDataModel>? _data;
  @override
  @JsonKey(name: 'data')
  List<TaskDataModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskResponseModel(page: $page, perPage: $perPage, total: $total, totalPages: $totalPages, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskResponseModelImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, perPage, total, totalPages,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskResponseModelImplCopyWith<_$TaskResponseModelImpl> get copyWith =>
      __$$TaskResponseModelImplCopyWithImpl<_$TaskResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskResponseModelImplToJson(
      this,
    );
  }
}

abstract class _TaskResponseModel implements TaskResponseModel {
  const factory _TaskResponseModel(
          {@JsonKey(name: 'page') final int? page,
          @JsonKey(name: 'per_page') final int? perPage,
          @JsonKey(name: 'total') final int? total,
          @JsonKey(name: 'total_pages') final int? totalPages,
          @JsonKey(name: 'data') final List<TaskDataModel>? data}) =
      _$TaskResponseModelImpl;

  factory _TaskResponseModel.fromJson(Map<String, dynamic> json) =
      _$TaskResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'page')
  int? get page;
  @override
  @JsonKey(name: 'per_page')
  int? get perPage;
  @override
  @JsonKey(name: 'total')
  int? get total;
  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  @JsonKey(name: 'data')
  List<TaskDataModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$TaskResponseModelImplCopyWith<_$TaskResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
