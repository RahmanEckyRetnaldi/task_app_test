import '../../../task.dart';

class SyncTaskUseCase {
  final TaskRepository _repository;

  SyncTaskUseCase(this._repository);

  Future<void> call() async => await _repository.syncUnsyncedTasks();
}
