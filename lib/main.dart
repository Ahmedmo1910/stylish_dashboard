import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/helper_functions/on_generate_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: onGenerateRoute,
    );
  }
}
