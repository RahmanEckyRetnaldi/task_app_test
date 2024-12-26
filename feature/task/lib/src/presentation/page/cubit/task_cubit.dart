import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/domain/entitiy/entitiy.dart';

part 'task_cubit.freezed.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState>
    with CustomSyncEmit
    implements BasePageListener<TaskState> {
  TaskCubit() : super(const TaskState());

  void init() {
    syncEmit(
        (state) => state.copyWith(status: FormzStatus.submissionInProgress));
    Future.delayed(const Duration(seconds: 2));
    syncEmit(
      (state) => state.copyWith(
        status: FormzStatus.submissionSuccess,
        listTask: [
          const TaskItemEntity(
              title: 'Title 1',
              description: 'Description 1',
              dueDate: '12 Jan 2025',
              status: TaskStatus.InProgress),
          const TaskItemEntity(
              title: 'Title 2',
              description: 'Description 2',
              dueDate: '13 Jan 2025',
              status: TaskStatus.Pending),
          const TaskItemEntity(
              title: 'Title 3',
              description: 'Description 3',
              dueDate: '13 Jan 2025',
              status: TaskStatus.Completed),
        ],
      ),
    );
  }

  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }
}
