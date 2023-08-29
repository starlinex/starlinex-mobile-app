import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';

class SpecialServiceItemsDetailsScreen extends StatefulWidget {

  const SpecialServiceItemsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<SpecialServiceItemsDetailsScreen> createState() => _SpecialServiceItemsDetailsScreenState();
}

class _SpecialServiceItemsDetailsScreenState extends State<SpecialServiceItemsDetailsScreen> {

  late BookingHistoryData data;
  late List<SpecialServices> list;

  @override
  void initState() {
    data = Get.arguments;
    list=data.specialServices ?? [];
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
            body: list.isNotEmpty?
            ListView.builder(
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
                        ItemWidget(title: 'Special Service Name', value: list[index].specialServiceName.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Special Service Pcs', value: list[index].specialServicePcs.toString()),
                      ],
                    ),
                  );
                }):
            Center(
              child: Text('No Data Found',
                style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500
                ),
              ),
            )
        ));
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
