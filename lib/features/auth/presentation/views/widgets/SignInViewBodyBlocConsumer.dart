import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:stylish_dashboard/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:stylish_dashboard/features/auth/presentation/views/widgets/custom_progress_hud.dart';
import 'package:stylish_dashboard/features/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:stylish_dashboard/features/dashboard/view/dashboard_screen.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, DashboardScreen.routeName);
        } else if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
