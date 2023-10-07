import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';

Future<Uint8List> makePdf(BookingHistoryData data) async {
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
  return pdf.save();
}
