
import 'package:auth/auth.dart';
import 'package:get_it/get_it.dart';
import 'package:navigation/src/repositories/auth_navigation_repository_impl.dart';
import 'package:navigation/src/repositories/home_navigation_repository_impl.dart';
import 'package:task/task.dart';
import 'injection.dart' as injection;

class NavigationModule {
  Future<void> call(GetIt di) async {
    injection.di = di;
    di.registerLazySingleton<AuthNavigationRepository>(
      () => AuthNavigationRepositoryImpl(),
    );
    di.registerLazySingleton<HomeNavigationRepository>(
      () => HomeNavigationRepositoryImpl(),
    );
  }
}
