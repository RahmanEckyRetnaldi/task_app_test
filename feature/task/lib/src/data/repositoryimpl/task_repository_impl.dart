import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/cupertino.dart';
import 'package:task/src/data/mapper/task_mapper.dart';
import 'package:task/src/domain/entitiy/task_item_entity.dart';
import 'package:task/task.dart';

class TaskRepositoryImpl extends TaskRepository {
  final TaskLocalDataSource localSource;
  final TaskRemoteDataSource remoteSource;
  final NetworkInfo networkInfo;

  TaskRepositoryImpl(this.localSource, this.remoteSource, this.networkInfo);

  @override
  Future<Either<Failure, bool>> deleteTask(String id) async {
    return apiTryCatch(execute: () async {
      try {
        final isConnected = await networkInfo.isConnected;
        if (!isConnected) {
          final localResult = await localSource.deleteTask(id);
          return Right(localResult);
        }
        final result = await remoteSource.deleteTask(id);
        if (!result) {
          return const Left(ErrorMessageFailure("Delete failed"));
        }
        // set new token
        final localResult = await localSource.deleteTask(id);
        return Right(localResult);
      } catch (e,stacktrace) {
        debugPrintStack(
          stackTrace: stacktrace,
          label: '${e.runtimeType} - $e',
        );
        return const Left(ErrorMessageFailure("Delete Error"));
      }
    });
  }

  @override
  Future<Either<Failure, List<TaskItemEntity>>> getTaskList() {
    return apiTryCatch(execute: () async {
      try {
        final isConnected = await networkInfo.isConnected;
        if (!isConnected) {
          return await _getTaskListLocal();
        }

        final result = await remoteSource.getTask();
        if (result.data == null) {
          return const Left(ErrorMessageFailure("Data from Service Not Found"));
        }
        return await _getTaskListLocal();
      } catch (e, stacktrace) {
        debugPrintStack(
          stackTrace: stacktrace,
          label: '${e.runtimeType} - $e',
        );
        return const Left(ErrorMessageFailure("Data Not execption Found "));
      }
    });
  }

  Future<Either<Failure, List<TaskItemEntity>>> _getTaskListLocal() async {
    try {
      final localResult = await localSource.getTask();
      if (localResult.isNotEmpty) {
        return Right(localResult.map((e) => e.toEntity()).toList());
      } else {
        await localSource.init();
        final localData = await localSource.getTask();
        return Right(localData.map((e) => e.toEntity()).toList());
      }
    } catch (e) {
      return const Left(ErrorMessageFailure("Data Not execption Found "));
    }
  }

  @override
  Future<Either<Failure, bool>> saveTask(TaskItemEntity task) {
    return apiTryCatch(execute: () async {
      try {
        final isConnected = await networkInfo.isConnected;
        if (!isConnected) {
          return _saveToLocal(task.toModelLocal());
        }
        final data = await remoteSource.getTask();
        final newId = '${data.total! + 1}';
        final result =
            await remoteSource.saveTask(task.copyWith(id: newId).toModel());
        if (result.id == null) {
          return const Left(ErrorMessageFailure("Data Not Found"));
        }

        final dataSync = task.toModelLocal().copyWith(isSynced: true);
        return await _saveToLocal(dataSync);
      } catch (e) {
        return const Left(ErrorMessageFailure("Failed Save Data"));
      }
    });
  }

  Future<Either<ErrorMessageFailure, bool>> _saveToLocal(
      TaskItemModel dataSync) async {
    final saveResult = await localSource.addOrUpdateTask(dataSync, false);
    if (!saveResult) {
      return const Left(ErrorMessageFailure("Failed Save Data"));
    }
    return Right(saveResult);
  }

  @override
  Future<Either<Failure, bool>> updateTask(TaskItemEntity task) {
    return apiTryCatch(execute: () async {
      try {
        final isConnected = await networkInfo.isConnected;
        if (!isConnected) {
          return await _updateTaskLocal(task.toModelLocal());
        }

        final result = await remoteSource.updateTask(task.toModel());
        if (result.id == null) {
          return const Left(ErrorMessageFailure("Data Not Found"));
        }
        return await _updateTaskLocal(task.toModelLocal());
      } catch (e) {
        return const Left(ErrorMessageFailure("Failed Update Data"));
      }
    });
  }

  Future<Either<Failure, bool>> _updateTaskLocal(TaskItemModel dataSync) async {
    final updateResult = await localSource.addOrUpdateTask(dataSync, true);
    if (!updateResult) {
      return const Left(ErrorMessageFailure("Failed Update Data"));
    } else {
      return Right(updateResult);
    }
    ;
  }
}
