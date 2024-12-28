import 'package:common_dependency/common_dependency.dart';

import '../../../task.dart';
import '../entitiy/entitiy.dart';

class SaveTaskUseCase {
  SaveTaskUseCase(this._repository);
  final TaskRepository _repository;
  Future<Either<Failure, bool>> call(TaskItemEntity task) async {
    return await _repository.saveTask(task);
  }
}