import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/utils/app_text_styles.dart';

AppBar buildAppBar(String text, {required BuildContext context}) {
  return AppBar(
    backgroundColor: const Color(0xFFFFFFFF),
    title: Text(
      text,
      style: AppTextStyles.medium18,
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
  );
}
