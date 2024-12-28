import 'package:common_dependency/common_dependency.dart';
import 'package:task/task.dart';

import '../entitiy/entitiy.dart';

class GetListTaskUseCase {
  final TaskRepository _repository;

  GetListTaskUseCase(this._repository);

  Future<Either<Failure, List<TaskItemEntity>>> call() => _repository.getTaskList();
}