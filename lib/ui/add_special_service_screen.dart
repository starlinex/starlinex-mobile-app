import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/special_service_controller.dart';
import '../components/button_widget.dart';

class AddSpecialServiceScreen extends StatefulWidget {
  const AddSpecialServiceScreen({Key? key}) : super(key: key);

  @override
  State<AddSpecialServiceScreen> createState() =>
      _AddSpecialServiceScreenState();
}

class _AddSpecialServiceScreenState extends State<AddSpecialServiceScreen> {

  var controller = Get.put(SpecialServiceController());

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
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Add Special Charge'.toUpperCase(),
                    style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20.h,top: 40.h),
                    padding: EdgeInsets.all(15.r),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.r)),
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey.withOpacity(0.4)),
                              ),
                              labelText: "Name",
                              hintText: "Choose Name",
                            ),
                          ),
                          onChanged: (value){
                            controller.name.value=value.toString();
                          },
                          selectedItem: "Food Items",
                        ),
                        SizedBox(height: 27.h),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                            showSearchBox: false,
                            showSelectedItems: true,
                          ),
                          items: ["1", '2', "3", '4', "5"],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10)),
                                borderSide: BorderSide(
                                    width: 2,
                                    color: Colors.grey.withOpacity(0.4)),
                              ),
                              labelText: "PCS",
                              hintText: "Choose PCS",
                            ),
                          ),
                          onChanged: (value){
                            controller.pcs.value=value.toString();
                          },
                          selectedItem: "1",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonWidget(
                    title: 'Submit',
                    onPressed: () {
                      controller.saveArgs();
                      Get.back(result: controller.args.value);
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
