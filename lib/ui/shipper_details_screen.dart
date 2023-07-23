import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_toast.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/shipper_details_controller.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';

class ShipperDetailsScreen extends StatefulWidget {
  const ShipperDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ShipperDetailsScreen> createState() => _ShipperDetailsScreenState();
}

class _ShipperDetailsScreenState extends State<ShipperDetailsScreen> {

  var controller=Get.put(ShipperDetailsController());
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
                                'SHIPPER / CONSIGNOR',
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
                          'Company',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Company';
                            } else {
                              controller.company.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.company.value = value;
                          },
                          title: 'Enter Company',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Person Name',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Person Name';
                            } else {
                              controller.personName.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.personName.value = value;
                          },
                          title: 'Enter Person Name',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Address 1',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Address';
                            } else {
                              controller.address1.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.address1.value = value;
                          },
                          title: 'Enter Address',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Address 2',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Enter Address';
                          //   } else {
                          //     controller.address2.value = value;
                          //   }
                          // },
                          onChanged: (value){
                            controller.address2.value = value;
                          },
                          title: 'Enter Address',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Address 3',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          // validator: (value) {
                          //   if (value!.isEmpty) {
                          //     return 'Enter Address';
                          //   } else {
                          //     controller.address3.value = value;
                          //   }
                          // },
                          onChanged: (value){
                            controller.address3.value = value;
                          },
                          title: 'Enter Address',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Post / Zip Code',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Post / Zip Code';
                            } else {
                              controller.postCode.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.postCode.value = value;
                          },
                          title: 'Enter Post / Zip Code',
                          inputType: TextInputType.number,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'City',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter City';
                            } else {
                              controller.city.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.city.value = value;
                          },
                          title: 'Enter City',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'State / County',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter State / County';
                            } else {
                              controller.state.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.state.value = value;
                          },
                          title: 'Enter State / County',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Country',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Obx(() =>  TextFieldWidget(
                          key: Key(controller.countryValue.value),
                          initialValue: controller.countryValue.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Choose Country';
                            }
                          },
                          onTap: (){
                            controller.showCountryList(context);
                          },
                          readOnly: true,
                          title: 'Choose Country',
                          inputType: TextInputType.text,
                        )),
                        SizedBox(height: 27.h),
                        Text(
                          'Phone Number',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Obx(() => Expanded(
                              flex: 3,
                              child: TextFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Code';
                                  }
                                },
                                key: Key(controller.countryCode.value),
                                initialValue: controller.countryCode.value,
                                readOnly: true,
                                title: 'Code',
                                inputType: TextInputType.number,
                              ),
                            )),
                            SizedBox(width: 10.w),
                            Expanded(
                              flex: 9,
                              child: TextFieldWidget(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Phone Number';
                                  } else {
                                    controller.phone.value = value;
                                  }
                                },
                                onChanged: (value){
                                  controller.phone.value = value;
                                },
                                title: 'Enter Phone Number',
                                inputType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Email Address',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email Address';
                            } else {
                              controller.email.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.email.value = value;
                          },
                          title: 'Enter Email Address',
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 27.h),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                            showSearchBox: false,
                            showSelectedItems: true,
                          ),
                          items: controller.kycList,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                              ),
                              labelText: "Kyc Type",
                              hintText: "Choose Kyc",
                            ),
                          ),
                          onChanged: (value){
                            controller.kycType.value=value.toString();
                          },
                          selectedItem: "AADHAAR NUMBER",
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Kyc Number',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        TextFieldWidget(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Kyc Number';
                            } else {
                              controller.kycNumber.value = value;
                            }
                          },
                          onChanged: (value){
                            controller.kycNumber.value = value;
                          },
                          title: 'Enter Kyc Number',
                          inputType: TextInputType.text,
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Upload Document',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 10.h),
                        Obx(() => Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  controller.pickImageFromGallery(1);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
                                  decoration:BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5.r),
                                      border: Border.all(color: Colors.black)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(controller.document1.value.isNotEmpty?'Uploaded':'Choose File',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color: controller.document1.value.isNotEmpty?Colors.green:Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 40.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: (){
                                  controller.pickImageFromGallery(2);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 10.h),
                                  decoration:BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(5.r),
                                      border: Border.all(color: Colors.black)
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(controller.document2.value.isNotEmpty?'Uploaded':'Choose File',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500,
                                        color:controller.document2.value.isNotEmpty?Colors.green:Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonWidget(
                    title: 'Next',
                    onPressed: () {
                      controller.saveArgs();
                      if(formKey.currentState!.validate()){
                        if(controller.document1.value.isNotEmpty && controller.document2.value.isNotEmpty){
                          controller.saveArgs();
                          Get.toNamed(AppRoutes.receiverDetails);
                        }else{
                          AppToast.showMessage('Please upload documents.');
                        }
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
