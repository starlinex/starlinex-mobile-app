import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_toast.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/special_service_controller.dart';
import '../app/utils/app_colors.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';
import '../data/arguments/special_service_args.dart';

class SpecialServiceScreen extends StatefulWidget {

  const SpecialServiceScreen({Key? key}) : super(key: key);

  @override
  State<SpecialServiceScreen> createState() => _SpecialServiceScreenState();
}

class _SpecialServiceScreenState extends State<SpecialServiceScreen> {
  var controller = Get.put(SpecialServiceController());
  late List<SpecialServiceArgs> serviceList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(120), // Set this height
              child: AppBarWidget(
                isBackEnable: true,
              )),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'SPECIAL SERVICE CHARGE',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 40.h),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            var navResponse = await Get.toNamed(
                                AppRoutes.addSpecialServiceScreen);
                            if (navResponse != null) {
                              serviceList.add(navResponse);
                              setState(() {});
                              String jsonTags = jsonEncode(serviceList);
                              print("ServiceList===>$jsonTags ");
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 60.w),
                            height: 40.h,
                            padding: EdgeInsets.only(
                                left: 15.w,
                                top: 10.h,
                                bottom: 10.h,
                                right: 15.w),
                            decoration: BoxDecoration(
                                color: Colors.lightGreen,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.add_circle_outlined,
                                  size: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  'Add Special Charge'.toUpperCase(),
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: serviceList.length,
                            itemBuilder: (context, index) {
                              return
                                Container(
                                padding: EdgeInsets.all(15.r),
                                margin: EdgeInsets.only(bottom: 15.h),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Name :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 10.w),
                                            Text(
                                              serviceList[index].name,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                            onTap: () {
                                              serviceList.removeAt(index);
                                              setState(() {});
                                            },
                                            child: const Icon(
                                              Icons.cancel,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                    Row(
                                      children: [
                                        Text(
                                          'Pcs :',
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black),
                                        ),
                                        SizedBox(width: 20.w),
                                        Text(
                                          serviceList[index].pcs,
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonWidget(
                    buttonColor: AppColors.themeColorBlue,
                    title: 'Skip',
                    onPressed: () {
                      Get.toNamed(AppRoutes.shipmentInvoice);
                    },
                  ),
                  SizedBox(height: 20.h),
                  ButtonWidget(
                    title: 'Next',
                    onPressed: () {
                      if (serviceList.isEmpty) {
                        AppToast.showMessage('Please add service');
                      } else {
                        controller.serviceList.value=serviceList;
                        Get.toNamed(AppRoutes.shipmentInvoice);
                      }
                    },
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          )),
    );
  }
}
