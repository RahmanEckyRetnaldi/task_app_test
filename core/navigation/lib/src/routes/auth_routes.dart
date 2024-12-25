
import 'package:flutter/cupertino.dart';
import 'package:nav_list/routes/auth_nav.dart';

import '../utils/utils_routes.dart';

class AuthRoutes extends RootRoute {
  AuthRoutes()
      : super(
          path: AuthNav.login.path,
          builder: (context, state) => Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Text("Login"),
          ),
        );
}
