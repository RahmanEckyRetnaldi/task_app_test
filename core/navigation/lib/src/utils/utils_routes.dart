import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
GlobalKey<NavigatorState>(debugLabel: 'root');

class RootRoute extends GoRoute {
  RootRoute({
    required super.path,
    super.name,
    Widget Function(BuildContext, GoRouterState)? builder,
    Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
    super.redirect,
    super.routes = const <RouteBase>[],
  }) : super(
    parentNavigatorKey: rootNavigatorKey,
    pageBuilder: pageBuilder ??
            (context, state) => MaterialPage(
          restorationId: state.fullPath,
          child: builder!(context, state),
        ),
  );
}