import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:stylish_dashboard/features/dashboard/view/dashboard_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stylish Dashboard',
      initialRoute: DashboardScreen.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
