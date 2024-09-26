import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:starlinex_courier/controllers/add_awb_controller.dart';
import 'package:starlinex_courier/controllers/add_weight_controller.dart';
import 'package:starlinex_courier/controllers/receiver_details_controller.dart';
import 'package:starlinex_courier/controllers/shipper_details_controller.dart';
import 'package:starlinex_courier/controllers/special_service_controller.dart';
import 'package:starlinex_courier/data/arguments/air_waybill_args.dart';
import 'package:starlinex_courier/data/arguments/shipment_invoice_args.dart';
import 'package:starlinex_courier/data/arguments/shipper_args.dart' as shipper;
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';
import 'package:starlinex_courier/network/api/requests/airway_info_request.dart';
import 'package:starlinex_courier/network/api/requests/common_request.dart';

import '../app/app_repository.dart';
import '../app/utils/app_preference.dart';
import '../app/utils/app_strings.dart';
import '../data/arguments/receiver_args.dart';
import '../data/arguments/store_airway_info_args.dart';
import '../network/api/api_response.dart';
import '../network/api/models/reset_password_model.dart';
import '../network/api/models/store_airway_info_model.dart';
import '../network/api/models/store_airway_model.dart';
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

  Future<ApiResponse<StoreAirwayModel>> storeAirwayInfo() async {
    String branchId=Get.find<AddAwbController>().branchId.toString();
    print("fdsfsdfds$branchId");
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
    print("BRAN==>${branchId}");
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
        shipmentItemsList: itemsList,
        branchId: branchId
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
      StoreAirwayMainData data=response.data().response!;
      sendMailToAdmin(data,branchId);
      return ApiResponse.success(response.data());
    } else {
      return ApiResponse.error(response.error());
    }
  }

  Future<File> generatePdfFile(StoreAirwayMainData data) async {
    final pdf = Document();
    String shipperAddress=data.shipperAddress1.toString();
    String receiverAddress=data.receiverAddress1.toString();
    String finalShipperAddress='';
    String finalReceiverAddress='';
    if(data.shipperAddress2!=null){
      finalShipperAddress="$shipperAddress ${data.shipperAddress2}";
    }
    if(data.shipperAddress3!=null){
      finalShipperAddress="$shipperAddress ${data.shipperAddress2} ${data.shipperAddress3}";
    }
    if(data.receiverAddress2!=null){
      finalReceiverAddress="$receiverAddress ${data.receiverAddress2}";
    }
    if(data.receiverAddress3!=null){
      finalReceiverAddress="$receiverAddress ${data.receiverAddress2} ${data.receiverAddress3}";
    }
    pdf.addPage(
      Page(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        build: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Table(
                  border: TableBorder.symmetric(outside: const BorderSide()),
                  children: [
                    TableRow(
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        children: [
                          Center(
                            child: Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: Text('INVOICE',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        fontBold: Font.timesBoldItalic()))),
                          )
                        ]),
                  ]),
              Table(
                  border: TableBorder.symmetric(outside: const BorderSide()),
                  children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "INVOICE NO.: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.invoiceNbr.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "INVOICE DATE.: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.invoiceDate.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "TOTAL PIECES: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                "1",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "CHARGEABLE WEIGHT: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.actualWeight.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          )
                        ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "AWB NO.: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.awbNbr.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Branch: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.branchName.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "OTHER REFERENCE",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "KYC NUMBER: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.shipperKycNbr.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Container(height: 15)
                        ]),
                      ),
                    ]),
                  ]),
              Table(
                  border: TableBorder.symmetric(outside: const BorderSide()),
                  children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          "SHIPPER",
                          style: TextStyle(
                              font: Font.helveticaBold(), fontSize: 12.sp),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          "CONSIGNEE",
                          style: TextStyle(
                              font: Font.helveticaBold(), fontSize: 12.sp),
                        ),
                      ),
                    ]),
                  ]),
              Table(
                  border: TableBorder.symmetric(outside: const BorderSide()),
                  children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                data.shipperPersonName.toString(),
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Company Name: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.shipperCompany.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "ADDRESS: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  font: Font.helveticaBold(), fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              finalShipperAddress.toString(),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "EMAIL: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.shipperEmailAddress.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "PHONE: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.shipperPhoneNbr.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          )
                        ]),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                data.receiverPersonName.toString(),
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Company Name: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.receiverCompany.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "ADDRESS: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  font: Font.helveticaBold(), fontSize: 12.sp),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              finalReceiverAddress.toString(),
                              style: TextStyle(fontSize: 12.sp),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "EMAIL: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.receiverEmailAddress.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "PHONE: ",
                                style: TextStyle(
                                    font: Font.helveticaBold(), fontSize: 12.sp),
                              ),
                              Text(
                                data.receiverPhoneNbr.toString(),
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ]),
                  ]),
              Table(
                  border: TableBorder.symmetric(outside: const BorderSide()),
                  children: [
                    TableRow(children: [
                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: const EdgeInsets.all(9.5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: PdfColor.fromHex("#000000"))),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Text(
                              "SR NO",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  font: Font.helveticaBold(), fontSize: 12.sp),
                            ),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            padding: const EdgeInsets.all(18),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: PdfColor.fromHex("#000000"))),
                            alignment: Alignment.topCenter,
                            width: double.infinity,
                            child: Text(
                              "DESCRIPTION",
                              style: TextStyle(
                                  font: Font.helveticaBold(), fontSize: 12.sp),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: PdfColor.fromHex("#000000"))),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Text(
                              "UNIT TYPE",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  font: Font.helveticaBold(), fontSize: 12.sp),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: PdfColor.fromHex("#000000"))),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Text(
                              "QUANTITY",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  font: Font.helveticaBold(), fontSize: 12.sp),
                            ),
                          )),
                      Expanded(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: PdfColor.fromHex("#000000"))),
                            alignment: Alignment.center,
                            width: double.infinity,
                            child: Text(
                              "UNIT RATES",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  font: Font.helveticaBold(), fontSize: 12.sp),
                            ),
                          )),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: PdfColor.fromHex("#000000"))),
                          alignment: Alignment.center,
                          width: double.infinity,
                          child: Text(
                            "AMOUNT(CFR)",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                font: Font.helveticaBold(), fontSize: 12.sp),
                          ),
                        ),
                      )
                    ]),
                  ]),
              ListView.builder(
                  itemCount:data.weightAndDimensions!.length,
                  itemBuilder: (context,index){
                    int srNo=index+1;
                    return Table(
                        border: TableBorder.symmetric(outside: const BorderSide()),
                        children: [
                          TableRow(children: [
                            Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: PdfColor.fromHex("#000000"))),
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "BOX NO: $srNo",
                                        style: TextStyle(
                                            font: Font.helveticaBold(), fontSize: 12.sp),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "DIMENSIONS (CMS) ${data.weightAndDimensions![index].lcm} * ${data.weightAndDimensions![index].bcm} * ${data.weightAndDimensions![index].hcm},",
                                        style: TextStyle(
                                            font: Font.helveticaBold(), fontSize: 12.sp),
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "ACTUAL WEIGHT - ${data.weightAndDimensions![index].actualWt} KG",
                                        style: TextStyle(
                                            font: Font.helveticaBold(), fontSize: 12.sp),
                                      ),
                                    ])
                            ),
                          ]),
                        ]);
                  }),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.shipmentDetailsList!.length,
                  itemBuilder:(context,index){
                    int srNo=index+1;
                    print('Data==>${data.shipmentDetailsList?[index].shipmentDescription}');
                    return Table(
                        border: TableBorder.symmetric(outside: const BorderSide()),
                        children: [
                          TableRow(children: [
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: PdfColor.fromHex("#000000"))),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Text(
                                    srNo.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        font: Font.helveticaBold(), fontSize: 12.sp),
                                  ),
                                )),
                            Expanded(
                                flex: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: PdfColor.fromHex("#000000"))),
                                  alignment: Alignment.topCenter,
                                  width: double.infinity,
                                  child: Text(
                                    '${data.shipmentDetailsList?[index].shipmentDescription}',
                                    maxLines:1,
                                    overflow:TextOverflow.visible,
                                    style: TextStyle(
                                        font: Font.helveticaBold(), fontSize: 12.sp),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: PdfColor.fromHex("#000000"))),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Text(
                                    "${data.shipmentDetailsList?[index].shipmentUnityType}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        font: Font.helveticaBold(), fontSize: 12.sp),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: PdfColor.fromHex("#000000"))),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Text(
                                    "${data.shipmentDetailsList?[index].shipmentQuantity}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        font: Font.helveticaBold(), fontSize: 12.sp),
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: PdfColor.fromHex("#000000"))),
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  child: Text(
                                    "${data.shipmentDetailsList?[index].shipmentUnitRates}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        font: Font.helveticaBold(), fontSize: 12.sp),
                                  ),
                                )),
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border:
                                    Border.all(color: PdfColor.fromHex("#000000"))),
                                alignment: Alignment.center,
                                width: double.infinity,
                                child: Text(
                                  "${data.shipmentDetailsList?[index].shipmentAmount}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      font: Font.helveticaBold(), fontSize: 12.sp),
                                ),
                              ),
                            )
                          ]),
                        ]);
                  }),
              Table(
                  border: TableBorder.symmetric(outside: const BorderSide()),
                  children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          "AMOUNT CHARGEABLE",
                          style: TextStyle(
                            // font: Font.helveticaBold(),
                              fontSize: 12.sp),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          "TOTAL : ${data.consignerAmount} INR",
                          style: TextStyle(
                              font: Font.helveticaBold(), fontSize: 12.sp),
                        ),
                      ),
                    ]),
                  ]),
              Table(
                  border: TableBorder.symmetric(outside: const BorderSide()),
                  children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          "NOTES",
                          style: TextStyle(
                              font: Font.helveticaBold(), fontSize: 12.sp),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          "SIGNATURE/STAMP",
                          style: TextStyle(
                              font: Font.helveticaBold(), fontSize: 12.sp),
                        ),
                      ),
                    ]),
                  ]),
              Table(
                  border: TableBorder.symmetric(outside: const BorderSide()),
                  children: [
                    TableRow(children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          data.descNote.toString(),
                          style: TextStyle(
                            // font: Font.helveticaBold(),
                              fontSize: 8.sp),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                            border:
                            Border.all(color: PdfColor.fromHex("#000000"))),
                        alignment: Alignment.topLeft,
                        width: double.infinity,
                        child: Text(
                          "",
                          style: TextStyle(
                              font: Font.helveticaBold(), fontSize: 12.sp),
                        ),
                      ),
                    ]),
                  ]),
            ],
          );
        },
      ),
    );
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/temp.pdf");
    await file.writeAsBytes(await pdf.save());
    return file;
  }

  Future<ApiResponse<BookingHistoryModel>> sendMailToAdmin(StoreAirwayMainData data, String branchId) async {
    File file=await generatePdfFile(data);
    String userId=AppPreference.getString(AppStrings.userId).toString();
    var request = CommonRequest(
        pdfFilePath: file.path,userId: userId,branchId: branchId);
    var response = await locator<AppRepository>().sendMail(request);
    if (response.isSuccess()) {
      print("SUCCESSMAIL");
      return ApiResponse.success(response.data());
    } else {
      return ApiResponse.error(response.error());
    }
  }

}
