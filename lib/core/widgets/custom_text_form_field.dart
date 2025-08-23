//import 'package:ecommerce/views/widgets/toastification_widget.dart';
import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/utils/app_colors.dart';
import 'package:stylish_dashboard/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final Color? fillColor;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxLines;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.onSaved,
    this.keyboardType,
    this.fillColor = const Color(0xFFF3F3F3),
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      validator: (input) {
        if (input == null || input.isEmpty) {
          /*
          ToastificationWidget.showError(
            context,
            title: "Error",
            description: "Please Enter your $hintText",
          );*/
          return "Please Enter your $hintText";
        }
        return null;
      },
      autofillHints: const [
        AutofillHints.email,
        AutofillHints.password,
        AutofillHints.name,
        AutofillHints.telephoneNumber
      ],
      cursorColor: AppColors.primaryColor,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.regular14.copyWith(
          color: const Color(0xFF676767),
        ),
        filled: true,
        fillColor: fillColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16.0,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
      keyboardType: keyboardType,
      onSaved: onSaved,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: Color(0xFFA8A8A9),
        width: 1,
      ),
    );
  }
}
