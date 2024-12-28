import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_list/nav_list.dart';
import 'package:task/task.dart';

class HomeNavigationRepositoryImpl extends HomeNavigationRepository {
  @override
  goToLogin(BuildContext context) {
    context.go(AuthNav.login.fullpath);
  }

}
