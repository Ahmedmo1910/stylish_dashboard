import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/widgets/custom_text_form_field.dart';

import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child:  Padding(
          padding:const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hintText: 'Product Name',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Category',
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                maxLines: 4,
                hintText: 'Product Description',
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  ImageField(
                    onFileChanged: (image){},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
