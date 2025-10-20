import 'package:flutter/material.dart';
import 'package:stylish_dashboard/features/auth/presentation/views/signin_screen.dart';
import 'package:stylish_dashboard/features/dashboard/view/dashboard_screen.dart';
import 'widgets/splash_screen_body.dart';
import 'package:stylish_dashboard/core/services/fire_base_auth_service.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    executeNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SplashScreenBody(),
    );
  }

  void executeNavigation() {
    Future.delayed(const Duration(seconds: 3), () {
      var isLoggedIn = FireBaseAuthService().isLoggedIn();
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, DashboardScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, SigninScreen.routeName);
      }
    });
  }
}
