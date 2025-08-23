import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/widgets/build_app_bar.dart';
import 'package:stylish_dashboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});
  static const routeName = 'addProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product'),
      body: const AddProductViewBody(),
    );
  }
}
