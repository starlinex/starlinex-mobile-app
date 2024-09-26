import 'package:country_code_picker/country_code_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/add_awb_controller.dart';
import 'package:starlinex_courier/controllers/shipper_details_controller.dart';
import 'package:starlinex_courier/network/api/models/address_list_model.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';
import '../components/loading_view.dart';
import '../components/text_field_widget.dart';

class ShipperDetailsScreen extends StatefulWidget {
  const ShipperDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ShipperDetailsScreen> createState() => _ShipperDetailsScreenState();
}

class _ShipperDetailsScreenState extends State<ShipperDetailsScreen> {

  var controller=Get.put(ShipperDetailsController());
  final formKey=GlobalKey<FormState>();
  int selectedIndex = -1;


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
                  GetBuilder<ShipperDetailsController>(
                    builder: (shipperController) {
                      return Form(
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
                            GetBuilder<ShipperDetailsController>(
                                builder: (awbController) {
                                  List<AddressListData> data;
                                  List<String> listAddress=[];
                                  if(awbController.addressListData==null){
                                    return const LoadingView();
                                  }else if(awbController.addressListData!.data().response!.isEmpty){
                                    return SizedBox(
                                      height: 50.h,
                                      child: DropdownSearch<String>(
                                        popupProps: const PopupProps.menu(
                                          showSearchBox: true,
                                          showSelectedItems: true,
                                        ),
                                        items: listAddress,
                                        dropdownDecoratorProps: DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                            ),
                                            isDense: true,
                                            labelText: "Search Address Book",
                                            hintText: "Search Address Book",
                                          ),
                                        ),
                                        onChanged: (value){

                                        },
                                        selectedItem:"No Address Found",
                                      ),
                                    );
                                  } else{
                                    data=awbController.addressListData!.data().response!;
                                    data.map((e) => listAddress.add(e.fullAddress.toString())).toList();
                                    return SizedBox(
                                      height: 50.h,
                                      child: DropdownSearch<String>(
                                        popupProps: const PopupProps.menu(
                                          showSearchBox: true,
                                          showSelectedItems: true,
                                        ),
                                        items: listAddress,
                                        dropdownDecoratorProps: DropDownDecoratorProps(
                                          dropdownSearchDecoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                              ),
                                              labelText: "Search Address Book",
                                              hintText: "Search Address Book",
                                              isDense: true
                                          ),
                                        ),
                                        onChanged: (value){
                                          controller.fullAddress.value=value.toString();
                                          selectedIndex = data.indexWhere((element) => element.fullAddress == value);
                                          if (selectedIndex != -1) {
                                            updateView(data[selectedIndex]);
                                          }
                                        },
                                        selectedItem:controller.fullAddress.value,
                                      ),
                                    );
                                  }
                                }
                            ),
                            SizedBox(height: 27.h),
                            Text(
                              'Company',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            TextFieldWidget(
                              controller:controller.companyController,
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
                              controller:controller.personController,
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
                             controller:controller.address1Controller,
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
                              controller:controller.address2Controller,
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
                              controller:controller.address3Controller,
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
                              controller:controller.zipCodeController,
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
                               controller:controller.cityController,
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
                             controller:controller.stateController,
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
                            TextFieldWidget(
                              controller:controller.countryController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Choose Country';
                                }
                              },
                              onTap: (){
                                // controller.showCountryList(context);
                              },
                              readOnly: true,
                              title: 'Choose Country',
                              inputType: TextInputType.text,
                            ),
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
                                Expanded(
                                  flex: 3,
                                  child: TextFieldWidget(
                                    controller:controller.countryCodeController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Code';
                                      }
                                    },
                                    readOnly: true,
                                    title: 'Code',
                                    inputType: TextInputType.number,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  flex: 9,
                                  child: TextFieldWidget(
                                    controller:controller.phoneController,
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
                                  ),)
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
                               controller:controller.emailController,
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
                            Obx(() =>  DropdownSearch<String>(
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
                              selectedItem: controller.kycType.value,
                            ),),
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
                               controller:controller.kycController,
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
                      );
                    }
                  ),
                  SizedBox(height: 40.h),
                  ButtonWidget(
                    title: 'Next',
                    onPressed: () {
                      if(formKey.currentState!.validate()){
                          controller.saveArgs();
                          Get.toNamed(AppRoutes.receiverDetails);
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

  void updateView(AddressListData data) {
    controller.company.value=data.company.toString();
    controller.personName.value=data.personName.toString();
    controller.address1.value=data.address1.toString();
    controller.address2.value=data.address2.toString();
    controller.address3.value=data.address3.toString();
    controller.postCode.value=data.zipCode.toString();
    controller.city.value=data.city.toString();
    controller.state.value=data.state.toString();
    controller.countryValue.value=data.country.toString();
    controller.phone.value=data.phoneNbr.toString();
    controller.email.value=data.emailAddress.toString();
    if(data.kycType!=null){
      controller.kycType.value=data.kycType.toString();
    }else{
      controller.kycType.value="AADHAAR NUMBER";
    }
    if(data.kycNbr!=null){
      controller.kycNumber.value=data.kycNbr.toString();
    }else{
      controller.kycNumber.value="";
    }
    List<Map<String, dynamic>> countries = codes;
    String actualNumber = controller.getActualNumber(controller.phone.value, countries);
    controller.phone.value=actualNumber;
    controller.initControllers();
  }

}
