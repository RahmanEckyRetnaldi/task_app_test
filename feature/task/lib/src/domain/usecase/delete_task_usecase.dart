import 'package:common_dependency/common_dependency.dart';

import '../../../task.dart';

class DeleteUseCase {
  final TaskRepository _repository;

  DeleteUseCase(this._repository);
  Future<Either<Failure,bool>> call(String id) async {
    return await _repository.deleteTask(id);
  }
}