import 'package:auth/auth.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/domain/entitiy/entitiy.dart';
import 'package:task/src/domain/usecase/delete_task_usecase.dart';
import 'package:task/src/domain/usecase/get_list_task_usecase.dart';
import 'package:task/src/domain/usecase/save_task_usecase.dart';
import 'package:task/src/domain/usecase/update_task_usecase.dart';

part 'task_cubit.freezed.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState>
    with CustomSyncEmit
    implements BasePageListener<TaskState> {
  TaskCubit(
    this.logoutUseCase,
    this.getListTaskUseCase,
    this.saveTaskUseCase,
    this.updateTaskUseCase,
    this.deleteUseCase,
  ) : super(TaskState(filters: {
          TaskStatus.Pending.name: false,
          TaskStatus.InProgress.name: false,
          TaskStatus.Completed.name: false,
        }));

  final LogoutUseCase logoutUseCase;
  final GetListTaskUseCase getListTaskUseCase;
  final SaveTaskUseCase saveTaskUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final DeleteUseCase deleteUseCase;

  void init() async {
    getTaskList();
  }

  Future<void> getTaskList() async {
    syncEmit(
        (state) => state.copyWith(status: FormzStatus.submissionInProgress));

    final result = await getListTaskUseCase();
    result.fold(
      (l) => syncEmit(
        (state) => state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: l,
        ),
      ),
      (r) => syncEmit(
        (state) => state.copyWith(
          status: FormzStatus.submissionSuccess,
          listTask: r,
          listFiltered: r,
        ),
      ),
    );
  }

  Future<void> addNewTask(TaskItemEntity task) async {
    syncEmit(
        (state) => state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await saveTaskUseCase(task);
    result.fold(
      (l) => syncEmit(
        (state) => state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: l,
        ),
      ),
      (r) {
        getTaskList();
      },
    );
  }

  Future<void> updateTask(TaskItemEntity task) async {
    syncEmit(
        (state) => state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await updateTaskUseCase(task);
    result.fold(
      (l) => syncEmit(
        (state) => state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: l,
        ),
      ),
      (r) {
        getTaskList();
      },
    );
  }

  Future<void> deleteTask(String id) async {
    syncEmit(
        (state) => state.copyWith(status: FormzStatus.submissionInProgress));
    final result = await deleteUseCase(id);
    result.fold(
      (l) => syncEmit(
        (state) => state.copyWith(
          status: FormzStatus.submissionFailure,
          failure: l,
        ),
      ),
      (r) {
        getTaskList();
      },
    );
  }

  Future<void> logout(Function() onLogoutSuccess) async {
    final result = await logoutUseCase();
    if (result) {
      onLogoutSuccess();
    }
  }

  Future<void> onSearchChanged(String value) async {
    syncEmit((state) =>
        state.copyWith(query: value, status: FormzStatus.submissionInProgress));
    await getTaskList();
    _applyFilters();
  }

  void toggleFilter(String filter) {
    final updatedFilters = Map<String, bool>.from(state.filters)
      ..update(filter, (value) => !value);
    syncEmit((state) => state.copyWith(filters: updatedFilters));
    _applyFilters();
  }

  void _applyFilters() async {
    final selectedFilters = state.filters.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    List<TaskItemEntity> filtered = state.listTask;

    if (selectedFilters.isNotEmpty) {
      filtered = filtered
          .where((task) => selectedFilters.contains(task.status.name))
          .toList();
    } else {
      filtered = state.listTask;
    }

    if (state.query.isNotEmpty) {
      filtered = filtered
          .where((task) =>
              task.title.toLowerCase().contains(state.query.toLowerCase()))
          .toList();
    }
    syncEmit((state) => (state.copyWith(
        listFiltered: filtered, status: FormzStatus.submissionSuccess)));
  }

  @override
  clearErrorState() {
    syncEmit((state) => state.copyWith(failure: null));
  }
}
