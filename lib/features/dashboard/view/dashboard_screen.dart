import 'package:flutter/material.dart';
import 'package:stylish_dashboard/features/dashboard/view/widgets/dashboard_view_body.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static const routeName = 'dashboard';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardViewBody(),
    );
  }
}
