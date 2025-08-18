import 'package:flutter/material.dart';
import 'package:stylish_dashboard/features/dashboard/view/dashboard_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardScreen.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
