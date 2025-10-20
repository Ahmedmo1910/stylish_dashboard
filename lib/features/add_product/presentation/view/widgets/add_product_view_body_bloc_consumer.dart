import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_dashboard/core/helper_functions/build_error_bar.dart';
import 'package:stylish_dashboard/features/add_product/presentation/manager/cubit/add_product_cubit_cubit.dart';
import 'package:stylish_dashboard/features/add_product/presentation/view/widgets/add_product_view_body.dart';
import 'package:stylish_dashboard/features/auth/presentation/views/widgets/custom_progress_hud.dart';

class AddProductViewBodyBlocConsumer extends StatelessWidget {
  const AddProductViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildErrorBar(
            context,
            'Product added successfully',
          );
        }
        if (state is AddProductFailure) {
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is AddProductLoading ? true : false,
            child: const AddProductViewBody());
      },
    );
  }
}
