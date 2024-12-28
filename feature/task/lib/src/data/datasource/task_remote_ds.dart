import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/data/datasource/endpoint/task_endpoint.dart';
import 'package:task/src/data/model/request/task_data_model.dart';
import 'package:task/src/data/model/response/task_response_model.dart';

import '../model/local/task_item_model.dart';

abstract class TaskRemoteDataSource {
  Future<TaskDataModel> saveTask(TaskDataModel task);

  Future<TaskResponseModel> getTask();

  Future<TaskDataModel> getTaskById(String id);

  Future<TaskDataModel> updateTask(TaskDataModel task);

  Future<bool> deleteTask(String id);
}

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final DioService service;

  TaskRemoteDataSourceImpl(this.service);

  @override
  Future<bool> deleteTask(String id) async {
    return await service.delete(
        endpoint: TaskEndpoint.task,
        converter: (respone) {
          return true;
        });
  }

  @override
  Future<TaskResponseModel> getTask() async {
    return await service.get(
        endpoint: TaskEndpoint.task,
        converter: (respone) {
          return TaskResponseModel.fromJson(respone);
        });
  }

  @override
  Future<TaskDataModel> getTaskById(String id) async {
    return await service.get(
        endpoint: '${TaskEndpoint.task}/$id',
        converter: (respone) {
          return TaskDataModel.fromJson(respone);
        });
  }

  @override
  Future<TaskDataModel> saveTask(TaskDataModel task) async {
    return await service.post(
        endpoint: TaskEndpoint.task,
        data: task.toJson(),
        converter: (respone) {
          print('Save: $respone');
          return TaskDataModel.fromJson(respone);
        },
    );
  }

  @override
  Future<TaskDataModel> updateTask(TaskDataModel task) async {
    return await service.put(
        endpoint: '${TaskEndpoint.task}/${task.id}',
        data: task.toJson(),
        converter: (respone) {
          return TaskDataModel.fromJson(respone);
        },
    );
  }
}
