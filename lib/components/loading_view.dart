import 'package:flutter/material.dart';
import 'package:starlinex_courier/app/utils/app_colors.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppColors.themeColorBlue
      ),
    );
  }
}
