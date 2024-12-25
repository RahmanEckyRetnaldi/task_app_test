import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_list/nav_list.dart';

class AuthNavigationRepositoryImpl implements AuthNavigationRepository {
  @override
  void goToHomePage(BuildContext context) {
    context.go(TaskNav.task.fullpath);
  }
}
