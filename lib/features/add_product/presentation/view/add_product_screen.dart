import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:stylish_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:stylish_dashboard/core/services/get_it_services.dart';
import 'package:stylish_dashboard/core/widgets/build_app_bar.dart';
import 'package:stylish_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit_cubit.dart';
import 'package:stylish_dashboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});
  static const routeName = 'addProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('Add Product', context: context),
      body: BlocProvider(
          create: (context) => AddProductCubit(
              getIt.get<ImagesRepo>(), getIt.get<ProductsRepo>()),
          child: const AddProductViewBody()),
    );
  }
}
