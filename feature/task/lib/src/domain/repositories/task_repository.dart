import 'package:common_dependency/common_dependency.dart';

import '../entitiy/entitiy.dart';

abstract class TaskRepository {
  Future<Either<Failure,List<TaskItemEntity>>> getTaskList();
  Future<Either<Failure,bool>> saveTask(TaskItemEntity task);
  Future<Either<Failure,bool>> updateTask(TaskItemEntity task);
  Future<Either<Failure,bool>> deleteTask(String id);
  Future<void> syncUnsyncedTasks();
}