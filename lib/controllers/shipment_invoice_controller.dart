import 'dart:convert';

import 'package:get/get.dart';
import 'package:starlinex_courier/controllers/add_awb_controller.dart';
import 'package:starlinex_courier/controllers/add_weight_controller.dart';
import 'package:starlinex_courier/controllers/receiver_details_controller.dart';
import 'package:starlinex_courier/controllers/shipper_details_controller.dart';
import 'package:starlinex_courier/controllers/special_service_controller.dart';
import 'package:starlinex_courier/data/arguments/air_waybill_args.dart';
import 'package:starlinex_courier/data/arguments/shipment_invoice_args.dart';
import 'package:starlinex_courier/data/arguments/shipper_args.dart' as shipper;
import 'package:starlinex_courier/network/api/requests/airway_info_request.dart';

import '../app/app_repository.dart';
import '../app/utils/app_preference.dart';
import '../app/utils/app_strings.dart';
import '../data/arguments/receiver_args.dart';
import '../data/arguments/store_airway_info_args.dart';
import '../network/api/api_response.dart';
import '../network/api/models/reset_password_model.dart';
import '../network/provider/service_locator.dart';

class ShipmentInvoiceController extends GetxController {

  var invoiceType = 'Invoice'.obs;
  var incoTerms = 'CFR'.obs;
  var noteText = 'UNSOLICITED GIFT SENT TO MY FRIENDS & FAMILY MEMBERS FOR THERE PERSONAL USE ONLY'
      .obs;
  var note = 'GIFT'.obs;
  var args = Rxn();
  List<String> docs = [];
  var itemsList=[].obs;
  var mLoading = false.obs;
  var shipmentTotalWeight = 0.obs;
  var shipmentTotalAmount = 0.obs;



  void saveArgs() {
    args.value = ShipperArgs(
      invoiceType: invoiceType.value,
      incoTerms: incoTerms.value,
      note: note.value,
      noteText: noteText.value,
    ).toJson();
  }

  Future<ApiResponse<ResetPasswordModel>> storeAirwayInfo() async {
    var addAwbModel=AirWayBillArgs.fromJson(Get.find<AddAwbController>().args.value);
    var shipperModel=shipper.ShipperArgs.fromJson(Get.find<ShipperDetailsController>().args.value);
    var receiverModel=ReceiverArgs.fromJson(Get.find<ReceiverDetailsController>().args.value);
    String totalActualWeight=Get.find<AddWeightController>().totalActualWeight.toString();
    String totalVolumetricWeight=Get.find<AddWeightController>().totalVolumetricWeight.toString();
    var weightList=Get.find<AddWeightController>().weightList;
    var serviceList=Get.find<SpecialServiceController>().serviceList;
    var shipmentInvoiceModel=ShipperArgs.fromJson(Get.find<ShipmentInvoiceController>().args.value);
    String shipmentTotalWeight=Get.find<ShipmentInvoiceController>().shipmentTotalWeight.toString();
    String shipmentTotalAmount=Get.find<ShipmentInvoiceController>().shipmentTotalAmount.toString();
    int userId=int.parse(AppPreference.getString(AppStrings.userId).toString());
    print('MODEL==>ADDAWBMODEL==>${addAwbModel.toJson()}');
    print('MODEL==>SHIPPERMODEL==>${shipperModel.toJson()}');
    print('MODEL==>RECEIVERMODEL==>${receiverModel.toJson()}');
    print('MODEL==>WEIGHTMODEL==>${jsonEncode(weightList)}');
    print('MODEL==>SERVICEMODEL==>${jsonEncode(serviceList)}');
    print('MODEL==>SHIPMENTINVOICEMODEL==>${shipmentInvoiceModel.toJson()}');
    print('MODEL==>SHIPMENTINVOICEITEMMODEL==>${jsonEncode(itemsList)}');
    var json=StoreAirwayInfoArgs(
        userId: userId,
        awbNo: addAwbModel.awbNo,
        destination: addAwbModel.destination,
        product: addAwbModel.product,
        bookingDate: addAwbModel.bookingDate,
        service: addAwbModel.service,
        insurance: addAwbModel.insurance,
        insuranceAmount: addAwbModel.insuranceAmount ?? '',
        insuranceValue: addAwbModel.insuranceValue ?? '',
        invoiceDate: addAwbModel.invoiceDate,
        invoiceNo: addAwbModel.invoiceNo,
        content: addAwbModel.content,
        company: shipperModel.company,
        personName: shipperModel.personName,
        address1: shipperModel.address1,
        address2: shipperModel.address2 ?? '',
        address3: shipperModel.address3 ?? '',
        postCode: shipperModel.postCode,
        city: shipperModel.city,
        state: shipperModel.state,
        country: shipperModel.country,
        phone: shipperModel.phone,
        email: shipperModel.email,
        kycType: shipperModel.kycType,
        kyuNumber: shipperModel.kyuNumber,
        searchAddress: receiverModel.searchAddress,
        rCompany: receiverModel.company,
        rPersonName: receiverModel.personName,
        rAddress1: receiverModel.address1,
        rAddress2: receiverModel.address2 ?? '',
        rAddress3: receiverModel.address3 ?? '',
        rPostCode: receiverModel.postCode,
        rCity: receiverModel.city,
        rState: receiverModel.state,
        rCountry: receiverModel.country,
        rPhone: receiverModel.phone,
        rPhone2: receiverModel.phone2,
        rEmail: receiverModel.email,
        invoiceType: shipmentInvoiceModel.invoiceType,
        incoTerms: shipmentInvoiceModel.incoTerms,
        note: shipmentInvoiceModel.note,
        noteText: shipmentInvoiceModel.noteText,
        actualTotalWeight: totalActualWeight,
        volumetricTotalWeight: totalVolumetricWeight,
        shipperTotalWeight: shipmentTotalWeight,
        shipperTotalAmount: shipmentTotalAmount,
        weightList: weightList,
        serviceList: serviceList,
        shipmentItemsList: itemsList
    ).toJson();
    docs.clear();
    if(shipperModel.document1.isNotEmpty){
      docs.add(shipperModel.document1);
    }
    if(shipperModel.document2.isNotEmpty){
      docs.add(shipperModel.document2);
    }
    var request = AirwayInfoRequest(
        docs: docs,
        json: json);
    var response = await locator<AppRepository>().storeAirwayInfo(request);
    if (response.isSuccess()) {
      return ApiResponse.success(response.data());
    } else {
      return ApiResponse.error(response.error());
    }
  }


}
