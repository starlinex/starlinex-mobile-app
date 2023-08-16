import 'dart:math';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/app/utils/app_toast.dart';
import 'package:starlinex_courier/data/arguments/air_waybill_args.dart';
import 'package:intl/intl.dart';
import 'package:starlinex_courier/network/api/models/service_list_model.dart';

import '../app/app_repository.dart';
import '../network/api/api_response.dart';
import '../network/provider/service_locator.dart';

class AddAwbController extends GetxController {

  var insuranceValue = 'no'.obs;
  String udid = 'Loading...';
  var destination = ''.obs;
  var product = ''.obs;
  var bookingDate = ''.obs;
  var invoiceDate = ''.obs;
  var service = ''.obs;
  var insurance = 'no'.obs;
  var insuranceAmount = ''.obs;
  var invoiceNo = ''.obs;
  var content = ''.obs;
  var args = Rxn();
  ApiResponse<ServiceListModel>? serviceListData;


  @override
  void onInit() {
    getUuid();
    getServiceList();
    super.onInit();
  }

  String? getUuid() {
    List<int> numberList = [];
    Random randomizer = Random();
    while (numberList.length < 5) {
      int random_number = randomizer.nextInt(1000000000);
      if (!numberList.contains(random_number)) {
        numberList.add(random_number);
      }
    }
    udid = numberList.join().substring(0, 10);
    return null;
  }

  void showCountryList(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        destination.value = country.name.toUpperCase();
      },
    );
  }

  Future<void> pickDate(BuildContext context, String type) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(), //- not to allow to choose before today.
        lastDate: DateTime(2100));
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      if (type == "booking") {
        bookingDate.value = formattedDate;
      } else if (type == "invoice") {
        invoiceDate.value = formattedDate;
      }
    } else {
      AppToast.showMessage('Something went wrong');
    }
  }

  void saveArgs() {
    args.value = AirWayBillArgs(
        awbNo: udid,
        destination: destination.value,
        product: product.value,
        bookingDate: bookingDate.value,
        service: service.value,
        insurance: insurance.value,
        insuranceAmount: insuranceAmount.value,
        insuranceValue: insuranceValue.value,
        invoiceDate: invoiceDate.value,
        invoiceNo: invoiceNo.value,
        content: content.value
    ).toJson();
  }

  Future<ApiResponse<ServiceListModel>?> getServiceList() async {
    var response=await locator<AppRepository>().getServices();
    if(response.isSuccess()){
      serviceListData= ApiResponse.success(response.data());
    }else{
      serviceListData= ApiResponse.error(response.error());
    }
    update();
    return null;
  }

}
