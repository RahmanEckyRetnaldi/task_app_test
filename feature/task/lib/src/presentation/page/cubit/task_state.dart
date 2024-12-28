part of 'task_cubit.dart';

@freezed
class TaskState with _$TaskState implements BasePageState {
  const TaskState._();

  const factory TaskState({
    @Default(FormzStatus.pure) FormzStatus status,
    Failure? failure,
    @Default('') String query,
    @Default([]) List<TaskItemEntity> listTask,
    @Default([]) List<TaskItemEntity> listFiltered,
    @Default({}) Map<String, bool> filters,
  }) = _TaskState;

  @override
  Failure? get errorState => failure;

  @override
  FormzStatus get statusState => status;
}
