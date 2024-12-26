// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TaskState {
  FormzStatus get status => throw _privateConstructorUsedError;
  Failure? get failure => throw _privateConstructorUsedError;
  List<TaskItemEntity> get listTask => throw _privateConstructorUsedError;
  TaskItemEntity get taskSelected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskStateCopyWith<TaskState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
  @useResult
  $Res call(
      {FormzStatus status,
      Failure? failure,
      List<TaskItemEntity> listTask,
      TaskItemEntity taskSelected});

  $TaskItemEntityCopyWith<$Res> get taskSelected;
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? listTask = null,
    Object? taskSelected = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      listTask: null == listTask
          ? _value.listTask
          : listTask // ignore: cast_nullable_to_non_nullable
              as List<TaskItemEntity>,
      taskSelected: null == taskSelected
          ? _value.taskSelected
          : taskSelected // ignore: cast_nullable_to_non_nullable
              as TaskItemEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskItemEntityCopyWith<$Res> get taskSelected {
    return $TaskItemEntityCopyWith<$Res>(_value.taskSelected, (value) {
      return _then(_value.copyWith(taskSelected: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TaskStateImplCopyWith<$Res>
    implements $TaskStateCopyWith<$Res> {
  factory _$$TaskStateImplCopyWith(
          _$TaskStateImpl value, $Res Function(_$TaskStateImpl) then) =
      __$$TaskStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {FormzStatus status,
      Failure? failure,
      List<TaskItemEntity> listTask,
      TaskItemEntity taskSelected});

  @override
  $TaskItemEntityCopyWith<$Res> get taskSelected;
}

/// @nodoc
class __$$TaskStateImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateImpl>
    implements _$$TaskStateImplCopyWith<$Res> {
  __$$TaskStateImplCopyWithImpl(
      _$TaskStateImpl _value, $Res Function(_$TaskStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? failure = freezed,
    Object? listTask = null,
    Object? taskSelected = null,
  }) {
    return _then(_$TaskStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
      failure: freezed == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
      listTask: null == listTask
          ? _value._listTask
          : listTask // ignore: cast_nullable_to_non_nullable
              as List<TaskItemEntity>,
      taskSelected: null == taskSelected
          ? _value.taskSelected
          : taskSelected // ignore: cast_nullable_to_non_nullable
              as TaskItemEntity,
    ));
  }
}

/// @nodoc

class _$TaskStateImpl extends _TaskState {
  const _$TaskStateImpl(
      {this.status = FormzStatus.pure,
      this.failure,
      final List<TaskItemEntity> listTask = const [],
      this.taskSelected = const TaskItemEntity()})
      : _listTask = listTask,
        super._();

  @override
  @JsonKey()
  final FormzStatus status;
  @override
  final Failure? failure;
  final List<TaskItemEntity> _listTask;
  @override
  @JsonKey()
  List<TaskItemEntity> get listTask {
    if (_listTask is EqualUnmodifiableListView) return _listTask;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listTask);
  }

  @override
  @JsonKey()
  final TaskItemEntity taskSelected;

  @override
  String toString() {
    return 'TaskState(status: $status, failure: $failure, listTask: $listTask, taskSelected: $taskSelected)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      __$$TaskStateImplCopyWithImpl<_$TaskStateImpl>(this, _$identity);
}

abstract class _TaskState extends TaskState {
  const factory _TaskState(
      {final FormzStatus status,
      final Failure? failure,
      final List<TaskItemEntity> listTask,
      final TaskItemEntity taskSelected}) = _$TaskStateImpl;
  const _TaskState._() : super._();

  @override
  FormzStatus get status;
  @override
  Failure? get failure;
  @override
  List<TaskItemEntity> get listTask;
  @override
  TaskItemEntity get taskSelected;
  @override
  @JsonKey(ignore: true)
  _$$TaskStateImplCopyWith<_$TaskStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
