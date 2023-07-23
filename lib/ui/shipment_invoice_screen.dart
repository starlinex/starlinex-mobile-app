import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/components/app_bar_widget.dart';
import 'package:starlinex_courier/controllers/shipment_invoice_controller.dart';
import '../app/utils/app_routes.dart';
import '../components/button_widget.dart';
import '../components/text_field_widget.dart';

class ShipmentInvoiceScreen extends StatefulWidget {
  const ShipmentInvoiceScreen({Key? key}) : super(key: key);

  @override
  State<ShipmentInvoiceScreen> createState() => _ShipmentInvoiceScreenState();
}

class _ShipmentInvoiceScreenState extends State<ShipmentInvoiceScreen> {

  var controller = Get.put(ShipmentInvoiceController());

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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                'CREATE SHIPMENT INVOICE',
                                style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 40.h),
                            ],
                          ),
                        ),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                            showSearchBox: false,
                            showSelectedItems: true,
                          ),
                          items: ["Invoice",],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                              ),
                              labelText: "Invoice Type",
                              hintText: "Choose Invoice Type",
                            ),
                          ),
                          onChanged: (value){
                            controller.invoiceType.value=value.toString();
                          },
                          selectedItem: "Invoice",
                        ),
                        SizedBox(height: 27.h),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                            showSearchBox: false,
                            showSelectedItems: true,
                          ),
                          items: ["CFR",],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                              ),
                              labelText: "Incoterms",
                              hintText: "Choose Incoterms",
                            ),
                          ),
                          onChanged: (value){
                            controller.incoTerms.value=value.toString();
                          },
                          selectedItem: "CFR",
                        ),
                        SizedBox(height: 27.h),
                        DropdownSearch<String>(
                          popupProps: const PopupProps.menu(
                            showSearchBox: false,
                            showSelectedItems: true,
                          ),
                          items: ["GIFT","SAMPLE"],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                              ),
                              labelText: "Note",
                              hintText: "Choose Option",
                            ),
                          ),
                          onChanged: (value){
                            controller.note.value=value.toString();
                            if(value=='GIFT'){
                              controller.noteText.value='UNSOLICITED GIFT SENT TO MY FRIENDS & FAMILY MEMBERS FOR THERE PERSONAL USE ONLY';
                            }else{
                              controller.noteText.value='FREE TRADE SAMPLES OF NO COMMERCIAL VALUE';
                            }
                          },
                          selectedItem: "Gift",
                        ),
                        SizedBox(height: 27.h),
                        Text(
                          'Note',
                          style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        SizedBox(height: 5.h),
                        Obx(() => TextFieldWidget(
                          key: Key(controller.noteText.value),
                          initialValue: controller.noteText.value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Note';
                            } else {
                              // controller.email.value = value;
                            }
                          },
                          title: 'Enter Note',
                          inputType: TextInputType.text,
                        ),)
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  ButtonWidget(
                    title: 'Next',
                    onPressed: () {
                      controller.saveArgs();
                      Get.toNamed(AppRoutes.shipmentInvoiceItems);
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
