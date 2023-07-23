import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/add_shipment_item_controller.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';

class AddShipmentItemScreen extends StatefulWidget {

  const AddShipmentItemScreen({Key? key}) : super(key: key);

  @override
  State<AddShipmentItemScreen> createState() => _AddShipmentItemScreenState();
}

class _AddShipmentItemScreenState extends State<AddShipmentItemScreen> {

  var controller=Get.put(AddShipmentItemController());
  final formKey = GlobalKey<FormState>();


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
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Text(
                                    'ADD SHIPMENT INVOICE ITEM',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                  ),
                                  SizedBox(height: 30.h),
                                ],
                              ),
                            ),
                            DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                showSearchBox: false,
                                showSelectedItems: true,
                              ),
                              items: ["1",],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                  ),
                                  labelText: "Box No.",
                                  hintText: "Choose Box No.",
                                ),
                              ),
                              onChanged: (value){
                                controller.boxNo.value=value.toString();
                              },
                              selectedItem: "1",
                            ),
                            SizedBox(height: 27.h),
                            DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                showSearchBox: true,
                                showSelectedItems: true,
                              ),
                              items: ["Base Metal Anklet",],
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                  ),
                                  labelText: "Description",
                                  hintText: "Choose Description",
                                ),
                              ),
                              onChanged: (value){
                                controller.description.value=value.toString();
                              },
                              selectedItem: "Base Metal Anklet",
                            ),
                            SizedBox(height: 27.h),
                            Text(
                              'Hs Code',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            TextFieldWidget(
                              readOnly: true,
                              initialValue: "0",
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Code';
                                } else {
                                  controller.hsCode.value = value;
                                }
                              },
                              title: 'Code',
                              inputType: TextInputType.number,
                            ),
                            SizedBox(height: 27.h),
                            DropdownSearch<String>(
                              popupProps: const PopupProps.menu(
                                showSearchBox: false,
                                showSelectedItems: true,
                              ),
                              items: controller.unitTypeList,
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                dropdownSearchDecoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                  ),
                                  labelText: "Unit Type",
                                  hintText: "Choose Unit Type",
                                ),
                              ),
                              onChanged: (value){
                                controller.unitType.value=value.toString();
                              },
                              selectedItem: "Pc",
                            ),
                            SizedBox(height: 27.h),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Quantity',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5.h),
                                      TextFieldWidget(
                                        initialValue: "",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter Quantity';
                                          } else {
                                            controller.quantity.value = int.parse(value);
                                          }
                                        },
                                        onChanged: (value){
                                          controller.quantity.value = int.parse(value);
                                          controller.calculateAmount();
                                        },
                                        title: 'Enter Quantity',
                                        inputType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Unit Weight',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5.h),
                                      TextFieldWidget(
                                        initialValue: "",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter Unit Weight';
                                          } else {
                                            controller.unitWeight.value = value;
                                          }
                                        },
                                        title: 'Enter Unit Weight',
                                        inputType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 27.h),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'IGST',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5.h),
                                      TextFieldWidget(
                                        initialValue: "",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter IGST';
                                          } else {
                                            controller.igst.value = value;
                                          }
                                        },
                                        title: 'Enter IGST',
                                        inputType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Unit Rates',
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(height: 5.h),
                                      TextFieldWidget(
                                        initialValue: "",
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter Unit Rates';
                                          } else {
                                            controller.unitRate.value = int.parse(value);
                                          }
                                        },
                                        onChanged: (value){
                                          controller.unitRate.value = int.parse(value);
                                          controller.calculateAmount();
                                        },
                                        title: 'Enter Unit Rates',
                                        inputType: TextInputType.number,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 27.h),
                            Text(
                              'Amount',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            SizedBox(height: 5.h),
                            Obx(() =>  TextFieldWidget(
                              readOnly: true,
                              key: Key(controller.amount.value.toString()),
                              initialValue: controller.amount.value.toString(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Amount';
                                }
                              },
                              title: 'Amount',
                              inputType: TextInputType.number,
                            )),
                            SizedBox(height:30.h),
                            ButtonWidget(
                              title: 'Submit',
                              onPressed: () {
                                if(formKey.currentState!.validate()){
                                  controller.saveArgs();
                                  Get.back(result: controller.args.value);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
