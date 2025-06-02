import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:flutter_isar_db/core/routes/route_name.dart' show RouteName;
import '../../feature/cubit/isar/isar_cubit.dart' show IsarCubit;
import '../../feature/pages/todo_isar_page.dart';
import '../../feature/pages/dashboard_page.dart' show DashboardPage;

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  if (settings.name == RouteName.dashboard) {
    return _buildRoute(settings, DashboardPage());
  } else if (settings.name == RouteName.isar) {
    var arguments = settings.arguments as Map<String, dynamic>;
    var appBarColor = arguments['appBarColor'];

    return _buildRoute(
      settings,
      BlocProvider(
        create: (_) => IsarCubit()..getAllUsers(),
        child: TodoIsarPage(appBarColor: appBarColor),
      ),
    );
  }
  return null;
}

MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
  return MaterialPageRoute(settings: settings, builder: (ctx) => builder);
}
