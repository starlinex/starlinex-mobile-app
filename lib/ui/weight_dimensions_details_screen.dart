import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';

import '../network/api/models/booking_history_model.dart';

class WeightDimensionsDetailsScreen extends StatefulWidget {
  const WeightDimensionsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<WeightDimensionsDetailsScreen> createState() =>
      _WeightDimensionsDetailsScreenState();
}

class _WeightDimensionsDetailsScreenState
    extends State<WeightDimensionsDetailsScreen> {

  late BookingHistoryData data;
  late List<WeightAndDimensions> list;
  late String totalActualWeight;
  late String totalVolumetricWeight;

  @override
  void initState() {
    data = Get.arguments;
    list=data.weightAndDimensions!;
    totalActualWeight=data.actualWeight.toString();
    totalVolumetricWeight=data.volumetricWeight.toString();
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
            body: Column(
              children: [
                SizedBox(height: 15.h),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(15.r),
                    margin: EdgeInsets.symmetric(horizontal:15.w),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r)),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Total Actual Weight',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.end,
                            totalActualWeight,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height:15.h),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(15.r),
                    margin: EdgeInsets.symmetric(horizontal:15.w),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r)),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Total Volumetric Weight',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.end,
                            totalVolumetricWeight,
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ),
                      ],
                    )
                ),
                SizedBox(height: 7.h),
                Expanded(
                  child: ListView.builder(
                      padding: EdgeInsets.all(15.r),
                      shrinkWrap: true,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        return Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(15.r),
                          margin: EdgeInsets.only(bottom: 15.h),
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ItemWidget(title: 'Actual Weight', value: list[index].actualWt.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'LCM', value: list[index].lcm.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'BCM', value: list[index].bcm.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'HCM', value: list[index].hcm.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'Volumetric Weight', value: list[index].volumetricWt.toString()),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            )));
  }
}

class ItemWidget extends StatelessWidget {
  final String title;
  final String value;
  const ItemWidget({Key? key,required this.title,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black),
          ),
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.end,
            value,
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
        ),
      ],
    );
  }
}
