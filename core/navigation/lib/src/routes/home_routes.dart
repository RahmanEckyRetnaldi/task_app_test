import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nav_list/nav_list.dart';

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: TaskNav.task.path,
          builder: (context, state) => Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: const Text("Splash"),
          ),
        );
}
