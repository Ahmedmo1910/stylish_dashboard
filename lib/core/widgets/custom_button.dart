import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/utils/app_colors.dart';
import 'package:stylish_dashboard/core/utils/app_text_styles.dart';


class MainButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final bool hasCircularBorder;
  final Widget? child;

  MainButton({
    super.key,
    this.text,
    this.onTap,
    this.hasCircularBorder = false,
    this.child,
  }) {
    assert(text != null || child != null);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: hasCircularBorder
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                )
              : null,
        ),
        child: text != null
            ? Text(
                text!,
                style: AppTextStyles.medium20.copyWith(
                  color: Colors.white,
                ),
              )
            : child,
      ),
    );
  }
}
