import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stylish_dashboard/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      onSaved: (value) {
        if (widget.onSaved != null) {
          widget.onSaved!(value);
        }
      },
      hintText: 'Password',
      obscureText: obscureText,
      prefixIcon: SvgPicture.asset(
        'assets/icons/lock.svg',
        fit: BoxFit.scaleDown,
      ),
      suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        },
        child: obscureText
            ? const Icon(
                Icons.visibility_off,
                color: Colors.grey,
                size: 24.0,
              )
            : const Icon(
                Icons.visibility,
                color: Colors.grey,
                size: 24.0,
              ),
      ),
    );
  }
}
