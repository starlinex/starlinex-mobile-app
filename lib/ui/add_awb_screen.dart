import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_colors.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/components/loading_view.dart';
import 'package:starlinex_courier/controllers/add_awb_controller.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';
import '../network/api/models/service_list_model.dart';

class AddAwbScreen extends StatefulWidget {
  const AddAwbScreen({Key? key}) : super(key: key);

  @override
  State<AddAwbScreen> createState() => _AddAwbScreenState();
}

class _AddAwbScreenState extends State<AddAwbScreen> {
  
   var controller=Get.put(AddAwbController());
   final formKey=GlobalKey<FormState>();

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
              padding: EdgeInsets.all(40.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'AIR WAYBILL INFORMATION',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 40.h),
                            ],
                          ),
                        ),
                        Text(
                          'AWB Number',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          key: Key(controller.udid),
                          readOnly: true,
                          initialValue: controller.udid,
                          title: 'Enter AWB Number',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Destination',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Obx(() => TextFieldWidget(
                          key: Key(controller.destination.value),
                          onTap: (){
                            controller.showCountryList(context);
                          },
                          initialValue: controller.destination.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose Destination';
                            }
                          },
                          title: 'Choose Destination',
                          readOnly: true,
                          inputType: TextInputType.text,
                        )),
                        SizedBox(height: 27.h),
                        Text(
                          'Product',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Product';
                            } else {
                              controller.product.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.product.value = value;
                          },
                          title: 'Enter Product',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Booking Date',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Obx(() => TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose Booking Date';
                            }
                          },
                          key: Key(controller.bookingDate.value),
                          initialValue:controller.bookingDate.value ,
                          onTap: (){
                            controller.pickDate(context,'booking');
                          },
                          readOnly: true,
                          title: 'Choose Booking Date',
                          inputType: TextInputType.text,
                        )),
                        SizedBox(height: 27.h),
                        GetBuilder<AddAwbController>(
                          builder: (awbController) {
                            List<ServiceListData> data;
                            List<String> listServices=[];
                            if(awbController.serviceListData==null){
                              return const LoadingView();
                            }else{
                              data=awbController.serviceListData!.data().response!;
                              data.map((e) => listServices.add(e.countryDesc.toString())).toList();
                              controller.service.value=data[0].countryDesc.toString();
                              return DropdownSearch<String>(
                                popupProps: const PopupProps.menu(
                                  showSearchBox: true,
                                  showSelectedItems: true,
                                ),
                                items: listServices,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                    ),
                                    labelText: "Service",
                                    hintText: "Choose Service",
                                  ),
                                ),
                                onChanged: (value){
                                  controller.service.value=value.toString();
                                },
                                selectedItem:data[0].countryDesc,
                              );
                            }
                          }
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Insurance',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Obx(() => Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                title: const Text("Yes"),
                                value: "true",
                                activeColor: AppColors.themeColorOrange,
                                groupValue: controller.insurance.value,
                                onChanged: (value){
                                  controller.insurance.value=value.toString();
                                },
                              ),
                            ),
                            Expanded(
                              child: RadioListTile(
                                title: const Text("No"),
                                value: "false",
                                activeColor: AppColors.themeColorOrange,
                                groupValue: controller.insurance.value,
                                onChanged: (value){
                                  controller.insurance.value=value.toString();
                                },
                              ),
                            ),
                          ],
                        )),
                        SizedBox(height: 10.h),
                        Obx(() => controller.insurance.value=='true'?Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Insurance Amount',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            TextFieldWidget(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Insurance Amount';
                                } else {
                                  controller.insuranceAmount.value = value;
                                }
                              },
                              onChanged: (value){
                                controller.insuranceAmount.value = value;
                              },
                              title: 'Enter Insurance Amount',
                              inputType: TextInputType.number,
                            ),
                            SizedBox(height: 27.h),
                            Text(
                              'Insurance Value',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            TextFieldWidget(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Insurance Value';
                                } else {
                                  controller.insuranceValue.value = value;
                                }
                              },
                              onChanged: (value){
                                controller.insuranceValue.value = value;
                              },
                              title: 'Insurance Value',
                              inputType: TextInputType.number,
                            ),
                            SizedBox(height: 27.h),
                          ],
                        ):Container()),
                        Text(
                          'Invoice Date',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Obx(() =>  TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose Invoice Date';
                            }
                          },
                          readOnly: true,
                          key: Key(controller.invoiceDate.value),
                          initialValue:controller.invoiceDate.value ,
                          onTap: (){
                            controller.pickDate(context,'invoice');
                          },
                          title: 'Choose Invoice Date',
                          inputType: TextInputType.text,
                        )),
                        SizedBox(height: 27.h),
                        Text(
                          'Invoice Number',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose Invoice Number';
                            } else {
                              controller.invoiceNo.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.invoiceNo.value = value;
                          },
                          title: 'Choose Invoice Number',
                          inputType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonWidget(
                    title: 'Next',
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                        controller.saveArgs();
                        Get.toNamed(AppRoutes.shipperDetails);
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
