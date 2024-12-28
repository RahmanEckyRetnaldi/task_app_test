library dependency_injection;

import 'package:auth/auth.dart';
import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:navigation/navigation.dart';
import 'package:splash/splash.dart';
import 'package:task/task.dart';

import 'src/hive/hive_config_module.dart';
export 'package:dependency_injection/dependency_injection.dart';

class DependencyInjector {
  //util
  final NetworkModule _networkModule = NetworkModule();
  final NavigationModule _navigationModule = NavigationModule();

  //package
  final AuthModule _internalAuthModule = AuthModule();
  final SplashModule _splashModule = SplashModule();
  final TaskModule _taskModule = TaskModule();
  final HiveConfigModule _hiveConfigModule = HiveConfigModule();

  Future<void> injectApp({
    required String baseUrl,
  }) async {
    if (kReleaseMode) {
      debugPrint = (String? message, {int? wrapWidth}) {};
    }
    await _networkModule(
      baseUrl: baseUrl,
      rootNavigatorKey: rootNavigatorKey,
    );
    // await _cachingModule(di, resetOnInstall: true);
    await _splashModule();
    await _navigationModule(di);
    await _internalAuthModule();
    await _taskModule();
    await _hiveConfigModule();
  }
}
