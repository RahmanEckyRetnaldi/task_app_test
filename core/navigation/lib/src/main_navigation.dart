import 'package:go_router/go_router.dart';
import 'package:lifecycle/lifecycle.dart';
import 'package:nav_list/routes/splash_nav.dart';
import 'package:navigation/src/routes/auth_routes.dart';
import 'package:navigation/src/routes/home_routes.dart';
import 'package:navigation/src/routes/splash_routes.dart';

import '../navigation.dart';

class MainNavigation {
  final router = GoRouter(
    routes: [
      SplashRoutes(),
      AuthRoutes(),
      HomeRoutes(),
    ],
    initialLocation: SplashNav.splash.fullpath,
    debugLogDiagnostics: true,
    observers: [defaultLifecycleObserver],
    navigatorKey: rootNavigatorKey,
  );
}
