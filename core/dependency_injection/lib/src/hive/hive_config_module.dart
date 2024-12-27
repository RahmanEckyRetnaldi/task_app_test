import 'package:auth/auth.dart';
import 'package:common_dependency/common_dependency.dart';

class HiveConfigModule{
  Future<void> call() async {
    await Hive.initFlutter();

    // Register adapters
    Hive.registerAdapter(UserModelAdapter());
    // Hive.registerAdapter(TaskItemEntityAdapter());

    // Open boxes
    await Hive.openBox<UserModel>(HiveBoxName.USER_BOX_NAME);
    // await Hive.openBox<TaskItemEntity>('taskBox');
  }

}