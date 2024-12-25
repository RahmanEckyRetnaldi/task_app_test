library dependency_injection;

import 'package:common_dependency/common_dependency.dart';
import 'package:flutter/foundation.dart';
import 'package:navigation/navigation.dart';
import 'package:network/network.dart';
import 'package:splash/splash.dart';


export 'package:dependency_injection/dependency_injection.dart';

class DependencyInjector {
  //util
  final NetworkModule _networkModule = NetworkModule();
  // final CachingModule _cachingModule = CachingModule();
  final NavigationModule _navigationModule = NavigationModule();

  //package
  // final AuthModule _internalAuthModule = AuthModule();
  final SplashModule _splashModule = SplashModule();

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

    /// event broadcaster
    /*di.registerLazySingleton<EventBroadcaster>(
          () => EventBroadcaster(),
    );
    await _homeModule();*/
  }
}
