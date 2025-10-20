import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_dashboard/core/widgets/custom_button.dart';
import 'package:stylish_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:stylish_dashboard/features/add_product/domain/entities/add_product_input_entity.dart';
import 'package:stylish_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit_cubit.dart';

import 'image_field.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, category, code, description;
  late num price;
  File? image;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hintText: 'Product Name',
                keyboardType: TextInputType.text,
                onSaved: (value) => name = value!,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Category',
                keyboardType: TextInputType.text,
                onSaved: (value) => category = value!,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                keyboardType: TextInputType.number,
                onSaved: (value) => price = num.parse(value!),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                onSaved: (value) => code = value!.toLowerCase(),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                maxLines: 4,
                hintText: 'Product Description',
                keyboardType: TextInputType.text,
                onSaved: (value) => description = value!,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ImageField(
                    onFileChanged: (image) {
                      this.image = image;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 32),
              MainButton(
                text: 'Add Product',
                hasCircularBorder: true,
                onTap: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      AddProductInputEntity input = AddProductInputEntity(
                          name: name,
                          category: category,
                          price: price,
                          code: code,
                          description: description,
                          imageFile: image!,
                          reviews: []);
                      context.read<AddProductCubit>().addProduct(input);
                      _formKey.currentState!.reset();
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  } else {
                    showError(context, 'Please select an image');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
