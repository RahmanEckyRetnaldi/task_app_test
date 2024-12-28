import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/data/model/local/task_item_model.dart';

import '../../domain/entitiy/entitiy.dart';

abstract class TaskLocalDataSource {
  Future<void> init();

  Future<bool> addOrUpdateTask(TaskItemModel task, bool isEdit);

  Future<List<TaskItemModel>> getTask();

  Future<TaskItemModel?> getTaskById(String id);

  Future<bool> deleteTask(String id);

  Future<bool> markTaskAsSynced(String id);
  Future<List<TaskItemModel>> getUnsyncedTasks();
}

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskItemModel> _taskBox =
      Hive.box<TaskItemModel>(HiveBoxName.TASK_BOX_NAME);

  @override
  Future<bool> deleteTask(String id) async {
    await _taskBox.delete(id);
    final result = await getTaskById(id);
    return result == null;
  }

  @override
  Future<List<TaskItemModel>> getTask() async {
    return _taskBox.values.toList();
  }

  @override
  Future<TaskItemModel?> getTaskById(String id) async {
    return _taskBox.get(id);
  }

  @override
  Future<bool> addOrUpdateTask(TaskItemModel task, bool isEdit) async {
    if (!isEdit) {
      final listTask = await getTask();
      final id= listTask.length + 1;
      final newTask = task.copyWith(id: id.toString());
      await _taskBox.put(newTask.id, newTask);
      final result = await getTaskById(newTask.id);
      return result != null;
    } else {
      await _taskBox.put(task.id, task);
      final result = await getTaskById(task.id);
      return result != null;
    }
  }

  @override
  Future<bool> markTaskAsSynced(String id) async {
    final task = _taskBox.get(id);
    if (task != null) {
      await _taskBox.put(id, task.copyWith(isSynced: true));
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<TaskItemModel>> getUnsyncedTasks() async {
    return _taskBox.values.where((task) => !task.isSynced).toList();
  }

  @override
  Future<void> init() async {
    final listInit = [
      TaskItemModel(
          id: '1',
          title: 'Title 1',
          description: 'Description 1',
          dueDate: '12 Jan 2025',
          status: TaskStatus.Pending.name),
      TaskItemModel(
          id: '2',
          title: 'Title 2',
          description: 'Description 2',
          dueDate: '13 Jan 2025',
          status: TaskStatus.InProgress.name),
      TaskItemModel(
          id: '3',
          title: 'Title 3',
          description: 'Description 3',
          dueDate: '13 Jan 2025',
          status: TaskStatus.Completed.name),
    ];
    for (var task in listInit) {
      await addOrUpdateTask(task, true);
    }
  }
}
