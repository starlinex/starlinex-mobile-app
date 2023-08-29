import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_routes.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/ui/pdf_preview_screen.dart';

import '../network/api/models/booking_history_model.dart';

class BookingDetailsScreen extends StatefulWidget {

  const BookingDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {

  late BookingHistoryData data;

  @override
  void initState() {
    data=Get.arguments;
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
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Get.to(PdfPreviewPage(data));
              },
              child: const Icon(Icons.picture_as_pdf),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15.r),
                    margin: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ItemWidget(title: 'AWB NO. :',value: data.awbNbr.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Destination :',value: data.destination.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Product :',value: data.product.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Booking Date :',value: data.bookingDate.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Service :',value: data.service.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Insurance :',value: data.insurance.toString()),
                        SizedBox(height: 10.h),
                        data.insurance==true?Column(
                          children: [
                            ItemWidget(title: 'Insurance Amount :',value: data.insuranceAmt.toString()),
                            SizedBox(height: 10.h),
                            ItemWidget(title: 'Insurance Value :',value: data.insuranceValue.toString()),
                          ],
                        ):Container(),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Invoice Date :',value: data.invoiceDate.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Invoice No. :',value: data.invoiceNbr.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Content :',value: data.content.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Company :',value: data.shipperCompany.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Person Name :',value: data.shipperPersonName.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Address 1 :',value: data.shipperAddress1.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Address 2 :',value: data.shipperAddress2.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Address 3 :',value: data.shipperAddress3.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Post Code :',value: data.shipperZipCode.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper City :',value: data.shipperCity.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper State :',value: data.shipperState.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Country :',value: data.shipperCountry.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Phone :',value: data.shipperPhoneNbr.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper Email :',value: data.shipperEmailAddress.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper KYC Type :',value: data.shipperKycType.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Shipper KYC No. :',value: data.shipperKycNbr.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Address Book :',value: data.receiverAddressBook.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Company :',value: data.receiverCompany.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Person Name :',value: data.receiverPersonName.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Address 1 :',value: data.receiverAddress1.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Address 2 :',value: data.receiverAddress2.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Address 3 :',value: data.receiverAddress3.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Post Code :',value: data.receiverZipCode.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver City :',value: data.receiverCity.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver State :',value: data.receiverState.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Country :',value: data.receiverCountry.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Phone :',value: data.receiverPhoneNbr.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Phone 2 :',value: data.receiverPhoneNbr2.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Receiver Email :',value: data.receiverEmailAddress.toString()),
                        SizedBox(height: 10.h),
                        ItemWidget(title: 'Note :',value: data.note.toString()),
                     ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                       Get.toNamed(AppRoutes.weightDimensionsDetails,arguments: data);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(15.r),
                      margin: EdgeInsets.symmetric(horizontal:15.w),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Weights & Dimensions',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                          const Icon(Icons.arrow_forward_ios,size: 20,)
                        ],
                      )
                    ),
                  ),
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.specialServiceItemDetails,arguments: data);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15.r),
                        margin: EdgeInsets.symmetric(horizontal:15.w),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Special Service Charge',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const Icon(Icons.arrow_forward_ios,size: 20,)
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 15.h),
                  GestureDetector(
                    onTap: (){
                      Get.toNamed(AppRoutes.shipmentInvoiceItemDetails,arguments: data);
                    },
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(15.r),
                        margin: EdgeInsets.symmetric(horizontal:15.w),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Shipment Invoice Items',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            const Icon(Icons.arrow_forward_ios,size: 20,)
                          ],
                        )
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
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

