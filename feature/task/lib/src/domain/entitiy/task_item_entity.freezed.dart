// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_item_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskItemEntity {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get dueDate => throw _privateConstructorUsedError;
  TaskStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskItemEntityCopyWith<TaskItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskItemEntityCopyWith<$Res> {
  factory $TaskItemEntityCopyWith(
          TaskItemEntity value, $Res Function(TaskItemEntity) then) =
      _$TaskItemEntityCopyWithImpl<$Res, TaskItemEntity>;
  @useResult
  $Res call(
      {String title, String description, String dueDate, TaskStatus status});
}

/// @nodoc
class _$TaskItemEntityCopyWithImpl<$Res, $Val extends TaskItemEntity>
    implements $TaskItemEntityCopyWith<$Res> {
  _$TaskItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? dueDate = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskItemEntityImplCopyWith<$Res>
    implements $TaskItemEntityCopyWith<$Res> {
  factory _$$TaskItemEntityImplCopyWith(_$TaskItemEntityImpl value,
          $Res Function(_$TaskItemEntityImpl) then) =
      __$$TaskItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, String description, String dueDate, TaskStatus status});
}

/// @nodoc
class __$$TaskItemEntityImplCopyWithImpl<$Res>
    extends _$TaskItemEntityCopyWithImpl<$Res, _$TaskItemEntityImpl>
    implements _$$TaskItemEntityImplCopyWith<$Res> {
  __$$TaskItemEntityImplCopyWithImpl(
      _$TaskItemEntityImpl _value, $Res Function(_$TaskItemEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? dueDate = null,
    Object? status = null,
  }) {
    return _then(_$TaskItemEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
    ));
  }
}

/// @nodoc

class _$TaskItemEntityImpl implements _TaskItemEntity {
  const _$TaskItemEntityImpl(
      {this.title = '',
      this.description = '',
      this.dueDate = '',
      this.status = TaskStatus.Pending});

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String dueDate;
  @override
  @JsonKey()
  final TaskStatus status;

  @override
  String toString() {
    return 'TaskItemEntity(title: $title, description: $description, dueDate: $dueDate, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskItemEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, dueDate, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskItemEntityImplCopyWith<_$TaskItemEntityImpl> get copyWith =>
      __$$TaskItemEntityImplCopyWithImpl<_$TaskItemEntityImpl>(
          this, _$identity);
}

abstract class _TaskItemEntity implements TaskItemEntity {
  const factory _TaskItemEntity(
      {final String title,
      final String description,
      final String dueDate,
      final TaskStatus status}) = _$TaskItemEntityImpl;

  @override
  String get title;
  @override
  String get description;
  @override
  String get dueDate;
  @override
  TaskStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$TaskItemEntityImplCopyWith<_$TaskItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
