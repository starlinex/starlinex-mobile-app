import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_toast.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/special_service_controller.dart';
import '../app/utils/app_colors.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';

class SpecialServiceScreen extends StatefulWidget {
  const SpecialServiceScreen({Key? key}) : super(key: key);

  @override
  State<SpecialServiceScreen> createState() => _SpecialServiceScreenState();
}

class _SpecialServiceScreenState extends State<SpecialServiceScreen> {

  var controller=Get.put(SpecialServiceController());


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
              padding: EdgeInsets.symmetric(vertical: 40.h,horizontal: 20.h),
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
                          onTap: (){
                            controller.addList();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 60.w),
                            height: 40.h,
                            padding: EdgeInsets.only(left: 15.w,top: 10.h,bottom: 10.h,right: 15.w),
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
                        Obx(() =>
                            ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.serviceList.length,
                            itemBuilder: (context,index){
                              return
                                Container(
                                  key: ObjectKey(index.toString()),
                                  margin: EdgeInsets.only(bottom: 20.h),
                                  padding: EdgeInsets.only(left: 15.w,top: 15.h,bottom: 15.h,right: 5.w),
                                  decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10.r)
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex:9,
                                        child: Column(
                                          children: [
                                            DropdownSearch<String>(
                                              popupProps: const PopupProps.menu(
                                                showSearchBox: false,
                                                showSelectedItems: true,
                                              ),
                                              items: controller.serviceItemsList,
                                              dropdownDecoratorProps: DropDownDecoratorProps(
                                                dropdownSearchDecoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                                  ),
                                                  labelText: "Name",
                                                  hintText: "Choose Name",
                                                ),
                                              ),
                                              onChanged: print,
                                              selectedItem: "Food Items",
                                            ),
                                            SizedBox(height: 27.h),
                                            DropdownSearch<String>(
                                              popupProps: const PopupProps.menu(
                                                showSearchBox: false,
                                                showSelectedItems: true,
                                              ),
                                              items: ["1",'2',"3",'4',"5"],
                                              dropdownDecoratorProps: DropDownDecoratorProps(
                                                dropdownSearchDecoration: InputDecoration(
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                    borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                                  ),
                                                  labelText: "PCS",
                                                  hintText: "Choose PCS",
                                                ),
                                              ),
                                              onChanged: print,
                                              selectedItem: "1",
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                      Expanded(
                                          flex: 1,
                                          child: GestureDetector(
                                            onTap: (){
                                              controller.serviceList.removeAt(index);
                                              controller.serviceList.refresh();
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(2.r),
                                                decoration: const BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle
                                                ),
                                                child: const Icon(Icons.close,size: 20,color: Colors.white,)),
                                          ))
                                    ],
                                  ),
                                );
                            }))
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
                      if(controller.serviceList.isEmpty){
                        AppToast.showMessage('Please add service');
                      }else{
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

