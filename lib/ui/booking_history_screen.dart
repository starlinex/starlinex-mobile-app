import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_colors.dart';
import 'package:starlinex_courier/app/utils/app_routes.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/booking_history_controller.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';

class BookingHistoryScreen extends StatefulWidget {

  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {

  late BookingHistoryController controller;

  @override
  void initState() {
    controller = Get.put(BookingHistoryController());
    controller.getBookingHistory();
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
            body: GetBuilder<BookingHistoryController>(
              builder: (controller) {
                return renderView(controller.bookingStatus);
              }
            )
           ));
  }

  Widget renderView(BookingListStatus bookingStatus) {
    switch (bookingStatus) {
      case BookingListStatus.loading:
        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.themeColorBlue,
          ),
        );
      case BookingListStatus.loaded:
        List<BookingHistoryData> data=controller.data!.data().response!;
        return  ListView.builder(
            padding: EdgeInsets.all(15.r),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return
                GestureDetector(
                  onTap: (){
                   Get.toNamed(AppRoutes.bookingDetails);
                  },
                  child:
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(15.r),
                    margin: EdgeInsets.only(bottom: 15.h),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'AWB NO. :',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black),
                                ),
                                SizedBox(width: 10.w),
                                Text(
                                  '           ${data[index].awbNbr}',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Text(
                              'Booking Data :',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              '${data[index].bookingDate}',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
            });
      case BookingListStatus.empty:
        return Center(
          child: Text('No History Found',
            style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500
            ),
          ),
        );;
      case BookingListStatus.error:
        return Center(
          child: Text('Something went wrong',
            style: TextStyle(
                color: Colors.red,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500
            ),
          ),
        );
    }
  }
}
