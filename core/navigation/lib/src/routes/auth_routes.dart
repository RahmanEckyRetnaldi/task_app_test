import 'package:auth/auth.dart';
import 'package:nav_list/routes/auth_nav.dart';

import '../utils/utils_routes.dart';

class AuthRoutes extends RootRoute {
  AuthRoutes()
      : super(
            path: AuthNav.login.path,
            builder: (context, state) => const LoginPage());
}
