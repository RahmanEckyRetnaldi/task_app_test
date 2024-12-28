import 'package:go_router/go_router.dart';
import 'package:nav_list/nav_list.dart';
import 'package:task/task.dart';

class HomeRoutes extends GoRoute {
  HomeRoutes()
      : super(
          path: TaskNav.task.path,
          builder: (context, state) => const TaskPage(),
        );
}
