import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_dashboard/core/widgets/custom_button.dart';
import 'package:stylish_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:stylish_dashboard/features/auth/presentation/cubit/sign_in_cubit.dart';
import 'package:stylish_dashboard/features/auth/presentation/views/widgets/password_field.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        
            const SizedBox(height: 32.0),
            CustomTextFormField(
              onSaved: (value) => email = value!,
              hintText: 'Username or Email',
              keyboardType: TextInputType.emailAddress,
              prefixIcon: SvgPicture.asset(
                'assets/icons/User.svg',
                fit: BoxFit.scaleDown,
                
              ),
            ),
            const SizedBox(height: 32.0),
            PasswordField(
              onSaved: (value) => password = value!,
            ),
            const SizedBox(height: 48.0),
            MainButton(
              text: 'Sign In',
              hasCircularBorder: true,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  context.read<SigninCubit>().signin(
                        email,
                        password,
                      );
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
