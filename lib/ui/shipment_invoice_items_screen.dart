import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_toast.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/data/arguments/shipment_item_args.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';

class ShipmentInvoiceItemsScreen extends StatefulWidget {

  const ShipmentInvoiceItemsScreen({Key? key}) : super(key: key);

  @override
  State<ShipmentInvoiceItemsScreen> createState() => _ShipmentInvoiceItemsScreenState();
}

class _ShipmentInvoiceItemsScreenState extends State<ShipmentInvoiceItemsScreen> {

  late List<ShipmentItemArgs> itemsList = [];
  int totalWeight=0;
  int totalAmount=0;

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
                                    'SHIPMENT INVOICE ITEMS',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 30.h),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                var navResponse =
                                    await Get.toNamed(AppRoutes.addShipmentItem);
                                if (navResponse != null) {
                                  itemsList.add(navResponse);
                                  totalWeight=0;
                                  totalAmount=0;
                                  itemsList.forEach((element){
                                    totalWeight+=int.parse(element.unitWeight);
                                    totalAmount+=int.parse(element.amount);
                                  });
                                  setState(() {});
                                  String jsonTags = jsonEncode(itemsList);
                                  print("WeightList===>$jsonTags ");
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(horizontal: 80.w),
                                height: 40.h,
                                padding: EdgeInsets.only(left: 10.w,top: 10.h,bottom: 10.h,right: 10.w),
                                decoration: BoxDecoration(
                                    color: Colors.lightGreen,
                                    borderRadius: BorderRadius.circular(10.r)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.add_circle_outlined,size: 20,color: Colors.white,),
                                    SizedBox(width: 10.w),
                                    Text(
                                      'Add Item'.toUpperCase(),
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
                                itemCount: itemsList.length,
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
                                                  itemsList[index].boxNo,
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight: FontWeight.w600,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                                onTap: (){
                                                  totalWeight-=int.parse(itemsList[index].unitWeight);
                                                  totalAmount-=int.parse(itemsList[index].amount);
                                                  itemsList.removeAt(index);
                                                  setState(() {

                                                  });
                                                },
                                                child: const Icon(Icons.cancel,color: Colors.red,))
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Description :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              itemsList[index].description,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Hs Code :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              itemsList[index].hsCode,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Unit Type :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              itemsList[index].unitType,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Quantity :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              itemsList[index].quantity,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Unit Weight :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              itemsList[index].unitWeight,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              'IGST :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              itemsList[index].igst,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Unit Rate :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              itemsList[index].unitRates,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5.h),
                                        Row(
                                          children: [
                                            Text(
                                              'Amount :',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 20.w),
                                            Text(
                                              itemsList[index].amount,
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
                          ],
                        ),
                      ),
                      SizedBox(height: 150.h),
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
                            'Total Weight',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            totalWeight.toString(),
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
                            'Total Amount',
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            totalAmount.toString(),
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
                        title: 'Submit',
                        onPressed: () {
                          if(itemsList.isEmpty){
                            AppToast.showMessage('Please add item');
                          }else{
                            // Get.toNamed(AppRoutes.receiverDetails);
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
