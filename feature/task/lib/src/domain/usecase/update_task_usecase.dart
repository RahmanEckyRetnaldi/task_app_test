import 'package:common_dependency/common_dependency.dart';

import '../../../task.dart';
import '../entitiy/entitiy.dart';

class UpdateTaskUseCase {
  final TaskRepository _repository;

  UpdateTaskUseCase(this._repository);

  Future<Either<Failure, bool>> call(TaskItemEntity task) async {
    return await _repository.updateTask(task);
  }
}
