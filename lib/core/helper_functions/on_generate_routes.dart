import 'package:flutter/material.dart';
import 'package:stylish_dashboard/features/add_product/presentation/view/add_product_screen.dart';
import 'package:stylish_dashboard/features/auth/presentation/views/signin_screen.dart';
import 'package:stylish_dashboard/features/dashboard/view/dashboard_screen.dart';
import 'package:stylish_dashboard/features/splash/presentation/views/splash_screen.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case DashboardScreen.routeName:
      return MaterialPageRoute(builder: (context) => const DashboardScreen());
    case AddProductScreen.routeName:
      return MaterialPageRoute(builder: (context) => const AddProductScreen());
    case SigninScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SigninScreen());
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
