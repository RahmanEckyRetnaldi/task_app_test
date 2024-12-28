import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/data/repositoryimpl/task_repository_impl.dart';
import 'package:task/src/domain/domain.dart';
import 'package:task/src/domain/repositories/repositories.dart';
import 'package:task/src/domain/usecase/delete_task_usecase.dart';
import 'package:task/src/domain/usecase/get_list_task_usecase.dart';
import 'package:task/src/domain/usecase/save_task_usecase.dart';
import 'package:task/src/domain/usecase/update_task_usecase.dart';
import 'package:task/src/presentation/page/cubit/task_cubit.dart';

import 'data/data.dart';
import 'domain/sync_manager/TaskSyncManager.dart';

class TaskModule {
  Future<void> call() async {
    //local
    di.registerLazySingleton<TaskLocalDataSource>(
        () => TaskLocalDataSourceImpl());

    //remote
    di.registerLazySingleton<TaskRemoteDataSource>(
        () => TaskRemoteDataSourceImpl(di()));

    //repository
    di.registerLazySingleton<TaskRepository>(
        () => TaskRepositoryImpl(di(), di(), di()));

    //usecase
    di.registerLazySingleton(() => GetListTaskUseCase(di()));
    di.registerLazySingleton(() => SaveTaskUseCase(di()));
    di.registerLazySingleton(() => UpdateTaskUseCase(di()));
    di.registerLazySingleton(() => DeleteUseCase(di()));
    di.registerLazySingleton(() => SyncTaskUseCase(di()));

    //cubit
    di.registerFactory(() => TaskCubit(di(), di(), di(), di(), di()));

    di.registerFactory(() => TaskSyncManager(
      di(),
      di(),
    ));

    di<TaskSyncManager>().startListener();
  }
}
