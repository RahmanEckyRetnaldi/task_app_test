import 'package:common_dependency/common_dependency.dart';
import 'package:task/src/presentation/page/cubit/task_cubit.dart';

class TaskModule {
  Future<void> call() async {

    //cubit
    di.registerFactory(() => TaskCubit(di()));
  }
}
