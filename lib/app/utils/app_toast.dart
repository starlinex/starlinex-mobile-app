import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_colors.dart';

class AppToast{


  static void showMessage(String message){
    Get.snackbar(
      'Alert',
      message,
      colorText: Colors.white,
      backgroundColor: AppColors.themeColorOrange,
      // icon: const Icon(Icons.add_alert),
    );
  }

}