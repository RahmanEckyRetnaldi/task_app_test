part of 'task_cubit.dart';

@freezed
class TaskState with _$TaskState implements BasePageState {
  const TaskState._();
  const factory TaskState({
    @Default(FormzStatus.pure) FormzStatus status,
    Failure? failure,
    @Default([]) List<TaskItemEntity> listTask,
    @Default(TaskItemEntity()) TaskItemEntity taskSelected,
  }) = _TaskState;

  @override
  Failure? get errorState => failure;

  @override
  FormzStatus get statusState => status;
}