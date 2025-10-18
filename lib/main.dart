import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_dashboard/core/helper_functions/on_generate_routes.dart';
import 'package:stylish_dashboard/core/services/custom_bloc_observer.dart';
import 'package:stylish_dashboard/core/services/get_it_services.dart';
import 'package:stylish_dashboard/features/dashboard/view/dashboard_screen.dart';
import 'package:stylish_dashboard/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        scaffoldBackgroundColor: const Color(0xFFFFFFFF),
        /*colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFFFFF),
        ),*/
      ),
      debugShowCheckedModeBanner: false,
      title: 'Stylish Dashboard',
      initialRoute: DashboardScreen.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
