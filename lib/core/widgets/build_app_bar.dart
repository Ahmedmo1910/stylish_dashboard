import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/utils/app_text_styles.dart';

AppBar buildAppBar(String text) {
  return AppBar(
    backgroundColor:const Color(0xFFFFFFFF),
    title: Text(text,style: AppTextStyles.medium18,),
    centerTitle: true,
  );
}
