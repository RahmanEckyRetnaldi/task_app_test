// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaskDataModel _$TaskDataModelFromJson(Map<String, dynamic> json) {
  return _TaskDataModel.fromJson(json);
}

/// @nodoc
mixin _$TaskDataModel {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'color')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'pantone_value')
  String? get dueDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskDataModelCopyWith<TaskDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskDataModelCopyWith<$Res> {
  factory $TaskDataModelCopyWith(
          TaskDataModel value, $Res Function(TaskDataModel) then) =
      _$TaskDataModelCopyWithImpl<$Res, TaskDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? title,
      @JsonKey(name: 'color') String? description,
      @JsonKey(name: 'pantone_value') String? dueDate});
}

/// @nodoc
class _$TaskDataModelCopyWithImpl<$Res, $Val extends TaskDataModel>
    implements $TaskDataModelCopyWith<$Res> {
  _$TaskDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? dueDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskDataModelImplCopyWith<$Res>
    implements $TaskDataModelCopyWith<$Res> {
  factory _$$TaskDataModelImplCopyWith(
          _$TaskDataModelImpl value, $Res Function(_$TaskDataModelImpl) then) =
      __$$TaskDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'name') String? title,
      @JsonKey(name: 'color') String? description,
      @JsonKey(name: 'pantone_value') String? dueDate});
}

/// @nodoc
class __$$TaskDataModelImplCopyWithImpl<$Res>
    extends _$TaskDataModelCopyWithImpl<$Res, _$TaskDataModelImpl>
    implements _$$TaskDataModelImplCopyWith<$Res> {
  __$$TaskDataModelImplCopyWithImpl(
      _$TaskDataModelImpl _value, $Res Function(_$TaskDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? dueDate = freezed,
  }) {
    return _then(_$TaskDataModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskDataModelImpl extends _TaskDataModel {
  const _$TaskDataModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'name') this.title,
      @JsonKey(name: 'color') this.description,
      @JsonKey(name: 'pantone_value') this.dueDate})
      : super._();

  factory _$TaskDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'name')
  final String? title;
  @override
  @JsonKey(name: 'color')
  final String? description;
  @override
  @JsonKey(name: 'pantone_value')
  final String? dueDate;

  @override
  String toString() {
    return 'TaskDataModel(id: $id, title: $title, description: $description, dueDate: $dueDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, dueDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskDataModelImplCopyWith<_$TaskDataModelImpl> get copyWith =>
      __$$TaskDataModelImplCopyWithImpl<_$TaskDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskDataModelImplToJson(
      this,
    );
  }
}

abstract class _TaskDataModel extends TaskDataModel {
  const factory _TaskDataModel(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'name') final String? title,
          @JsonKey(name: 'color') final String? description,
          @JsonKey(name: 'pantone_value') final String? dueDate}) =
      _$TaskDataModelImpl;
  const _TaskDataModel._() : super._();

  factory _TaskDataModel.fromJson(Map<String, dynamic> json) =
      _$TaskDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'name')
  String? get title;
  @override
  @JsonKey(name: 'color')
  String? get description;
  @override
  @JsonKey(name: 'pantone_value')
  String? get dueDate;
  @override
  @JsonKey(ignore: true)
  _$$TaskDataModelImplCopyWith<_$TaskDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
