import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_dashboard/core/services/get_it_services.dart';
import 'package:stylish_dashboard/features/auth/domain/repos/auth_repo.dart';
import 'package:stylish_dashboard/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:stylish_dashboard/features/auth/presentation/views/widgets/SignInViewBodyBlocConsumer.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  static const String routeName = 'SigninScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt<AuthRepo>(),
      ),
      child: const Scaffold(
        body: SafeArea(child: SignInViewBodyBlocConsumer()),
      ),
    );
  }
}
