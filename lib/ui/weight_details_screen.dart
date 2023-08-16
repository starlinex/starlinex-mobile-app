import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_toast.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/data/arguments/weight_args.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';

class WeightDetailsScreen extends StatefulWidget {

  const WeightDetailsScreen({Key? key}) : super(key: key);

  @override
  State<WeightDetailsScreen> createState() => _WeightDetailsScreenState();
}

class _WeightDetailsScreenState extends State<WeightDetailsScreen> {

  late List<WeightArgs> weightList = [];
  int actualWeight=0;
  double volumetricWeight=0.0;

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
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(40.r),
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
                                    'WEIGHTS AND DIMENSIONS',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                var navResponse =
                                    await Get.toNamed(AppRoutes.addWeight);
                                if (navResponse != null) {
                                  weightList.add(navResponse);
                                  actualWeight=0;
                                  volumetricWeight=0.0;
                                  weightList.forEach((element){
                                    actualWeight+=int.parse(element.actualWeight);
                                    volumetricWeight+=double.parse(element.volumetricWeight);
                                  });
                                  setState(() {});
                                  String jsonTags = jsonEncode(weightList);
                                  print("WeightList===>$jsonTags ");
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
                                      'Add New Weight'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: weightList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    padding: EdgeInsets.all(15.r),
                                    margin: EdgeInsets.only(bottom: 15.h),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.2),
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Box No :',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w400,
                                                      color: Colors.black),
                                                ),
                                                SizedBox(width: 20.w),
                                                Text(
                                                  '${index+1}',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                                onTap: (){
                                                  actualWeight-=int.parse(weightList[index].actualWeight);
                                                  volumetricWeight-=double.parse(weightList[index].volumetricWeight);
                                                  weightList.removeAt(index);
                                                  setState(() {});
                                                },
                                                child: const Icon(Icons.cancel,color: Colors.red,))
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Actual Weight :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              weightList[index].actualWeight,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Text(
                                              'L(CM) :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              weightList[index].lcm,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Text(
                                              'B(CM) :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              weightList[index].bcm,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Text(
                                              'H(CM) :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              weightList[index].hcm,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Volumetric Weight :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              weightList[index].volumetricWeight,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                }),
                            SizedBox(height: 120.h)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 160.h,
                  color: Colors.grey.shade200,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10.r),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Actual Weight',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            actualWeight.toString(),
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Volumetric Weight',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            volumetricWeight.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      ButtonWidget(
                        margin: EdgeInsets.symmetric(horizontal: 20.w),
                        title: 'Next',
                        onPressed: () {
                          if(weightList.isEmpty){
                            AppToast.showMessage('Please add weight');
                          }else{
                            Get.toNamed(AppRoutes.specialService);
                          }
                        },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
