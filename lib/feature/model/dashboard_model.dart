import 'package:flutter/material.dart';

import '../../core/routes/route_name.dart';

class DashboardModel {
  String label;
  String routName;
  Color? color;

  DashboardModel({this.label = '', this.routName = '', this.color});

  List<DashboardModel> getDashboardList() {
    return [
      DashboardModel(
        label: "Isar",
        routName: RouteName.isar,
        color: Colors.deepPurple.shade100,
      ),
    ];
  }
}
