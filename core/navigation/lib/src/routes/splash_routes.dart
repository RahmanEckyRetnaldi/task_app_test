
import 'package:nav_list/nav_list.dart';
import 'package:splash/splash.dart';

import '../utils/utils_routes.dart';

class SplashRoutes extends RootRoute {
  SplashRoutes()
      : super(
          path: SplashNav.splash.path,
          builder: (context, state) => const SplashPage(),
        );
}
