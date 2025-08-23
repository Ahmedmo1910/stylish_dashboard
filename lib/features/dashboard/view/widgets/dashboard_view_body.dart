import 'package:flutter/material.dart';
import 'package:stylish_dashboard/core/widgets/custom_button.dart';
import 'package:stylish_dashboard/features/add_product/presentation/view/add_product_screen.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MainButton(
            hasCircularBorder: true,
            text: 'Add Data',
            onTap: () {
              Navigator.pushNamed(context, AddProductScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
