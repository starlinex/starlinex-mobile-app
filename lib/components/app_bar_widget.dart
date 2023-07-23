import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app/utils/app_assets.dart';

class AppBarWidget extends StatelessWidget {
  final bool? isBackEnable;
  const AppBarWidget({Key? key, this.isBackEnable=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 60,
      // color: AppColors.themeColorBlue,
      width: double.infinity,
      child: isBackEnable!?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Container(
              alignment: Alignment.center,
                margin: EdgeInsets.only(left: 25.w,top: 17.h),
                child: const Icon(Icons.arrow_back_ios)),
          ),
          Image.asset(
            AppAssets.appLogo, height: 40,width: 150,fit: BoxFit.fitWidth,),
          Container(
            margin: EdgeInsets.only(right: 50.w),
          )
        ],
      ):Image.asset(
        AppAssets.appLogo, height: 40,width: 150,fit: BoxFit.fitWidth,),
    );
  }
}
