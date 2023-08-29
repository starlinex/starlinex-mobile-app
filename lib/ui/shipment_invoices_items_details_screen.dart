import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';

import '../network/api/models/booking_history_model.dart';

class ShipmentInvoiceItemsDetailsScreen extends StatefulWidget {
  const ShipmentInvoiceItemsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ShipmentInvoiceItemsDetailsScreen> createState() =>
      _ShipmentInvoiceItemsDetailsScreenState();
}

class _ShipmentInvoiceItemsDetailsScreenState
    extends State<ShipmentInvoiceItemsDetailsScreen> {

  late BookingHistoryData data;
  late List<ShipmentDetailsList> list;
  late String totalWeight;
  late String totalAmount;

  @override
  void initState() {
    data = Get.arguments;
    list=data.shipmentDetailsList!;
    totalWeight=data.consignerWeight.toString();
    totalAmount=data.consignerAmount.toString();
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
                            'Total Shipment Weight',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.end,
                            totalWeight,
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
                            'Total Shipment Amount',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            textAlign: TextAlign.end,
                            totalAmount,
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
                  child:
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
                              ItemWidget(title: 'Shipment Description', value: list[index].shipmentDescription.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'HS Code', value: list[index].shipmentHsCode.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'Unit Type', value: list[index].shipmentUnityType.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'Quantity', value: list[index].shipmentQuantity.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'Unit Weight', value: list[index].shipmentUnitWeight.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'IGST', value: list[index].shipmentIgst.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'Unit Rate', value: list[index].shipmentUnitRates.toString()),
                              SizedBox(height: 10.h),
                              ItemWidget(title: 'Amount', value: list[index].shipmentAmount.toString()),
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
