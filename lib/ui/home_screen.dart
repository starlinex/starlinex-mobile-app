import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_preference.dart';
import 'package:starlinex_courier/app/utils/app_routes.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import '../components/button_widget.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(120), // Set this height
              child: AppBarWidget()
          ),
          body: Padding(
            padding:
            EdgeInsets.all(40.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonWidget(
                  title: 'Create Booking',
                  onPressed: () {
                    Get.toNamed(AppRoutes.addAwb);
                  },
                ),
                SizedBox(height: 30.h),
                ButtonWidget(
                  title: 'Booking History',
                  onPressed: () {
                    Get.toNamed(AppRoutes.bookingHistory);
                  },
                ),
                SizedBox(height: 30.h),
                ButtonWidget(
                  title: 'Logout',
                  onPressed: () {
                    AppPreference.clear();
                    Get.toNamed(AppRoutes.login);
                  },
                ),
                SizedBox(height: 28.h),
              ],
            ),
          )),
    );
  }

}
