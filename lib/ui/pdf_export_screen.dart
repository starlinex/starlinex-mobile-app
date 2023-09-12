import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';

Future<Uint8List> makePdf(BookingHistoryData data) async {
  final pdf = Document();
  pdf.addPage(
    Page(
      margin: EdgeInsets.symmetric(horizontal: 50.w, vertical: 10.h),
      build: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Table(
                border: TableBorder.symmetric(outside: const BorderSide()),
                children: [
                // Container(
                //     child: Text('INVOICE',
                //         style: TextStyle(
                //             fontSize: 20.sp, fontBold: Font.timesBoldItalic()))),
                // SizedBox(height: 10.h),
                TableRow(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'INVOICE NO.:',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              data.invoiceNbr.toString(),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'AWB NO.:',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              data.awbNbr.toString(),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                // SizedBox(height: 5.h),
                TableRow(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'INVOICE DATE.:',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Text(
                              data.invoiceDate.toString(),
                              style: TextStyle(
                                fontSize: 12.sp,
                              ),
                            ),
                          ]),
                    ),
                    Expanded(
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'OTHER REFERENCE',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'TOTAL PIECES :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.pcs.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'KYC NO. :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.shipperKycNbr.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'CHARGEABLE WEIGHT :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.chargeableWeight.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //     Container(),
                //   ],
                // ),
                // SizedBox(height: 10.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'SHIPPER',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //           ]),
                //     ),
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'CONSIGNEE',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //           ]),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 10.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               data.shipperPersonName.toString(),
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //           ]),
                //     ),
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               data.receiverPersonName.toString(),
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //           ]),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'COMPANY NAME :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.shipperCompany.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'COMPANY NAME :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.receiverCompany.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'ADDRESS :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.shipperAddress1.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'ADDRESS :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.receiverAddress1.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     data.shipperAddress2!=null?Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               data.shipperAddress2.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ):Container(),
                //     data.receiverAddress2!=null?Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               data.receiverAddress2.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ):Container()
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     data.shipperAddress3!=null?Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               data.shipperAddress3.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ):Container(),
                //     data.receiverAddress3!=null?Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               data.receiverAddress3.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ):Container()
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'EMAIL :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.shipperEmailAddress.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'EMAIL :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.receiverEmailAddress.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'PHONE NUMBER :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.shipperPhoneNbr.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //     Expanded(
                //       child: Row(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'PHONE NUMBER :',
                //               style: TextStyle(
                //                   fontSize: 12.sp,
                //                   fontWeight: FontWeight.bold
                //               ),
                //             ),
                //             SizedBox(width: 10.w),
                //             Text(
                //               data.receiverPhoneNbr.toString(),
                //               style: TextStyle(
                //                 fontSize: 12.sp,
                //               ),
                //             ),
                //           ]),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // data.shipperAddress2 != null
                //     ? Column(children: [
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: Text(
                //           'Shipper Address 2 :',
                //           style: TextStyle(
                //             fontSize: 12.sp,
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Text(
                //           data.shipperAddress2.toString(),
                //           style: TextStyle(
                //             fontSize: 12.sp,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   SizedBox(height: 5.h),
                // ])
                //     : Container(),
                // data.shipperAddress3 != null
                //     ? Column(children: [
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: Text(
                //           'Shipper Address 3 :',
                //           style: TextStyle(
                //             fontSize: 12.sp,
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Text(
                //           data.shipperAddress3.toString(),
                //           style: TextStyle(
                //             fontSize: 12.sp,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   SizedBox(height: 5.h),
                // ])
                //     : Container(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Shipper Post Code :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.shipperZipCode.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Shipper City :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.shipperCity.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Shipper State :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.shipperState.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Shipper Country :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.shipperCountry.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Shipper Phone :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.shipperPhoneNbr.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Shipper Email :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.shipperEmailAddress.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Shipper KYC Type :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.shipperKycType.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Shipper KYC No. :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.shipperKycNbr.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Address Book :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverAddressBook.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver Company :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverCompany.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver Person Name :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverPersonName.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver Address 1 :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverAddress1.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // data.receiverAddress2 != null
                //     ? Column(children: [
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: Text(
                //           'Receiver Address 2 :',
                //           style: TextStyle(
                //             fontSize: 12.sp,
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Text(
                //           data.receiverAddress2.toString(),
                //           style: TextStyle(
                //             fontSize: 12.sp,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   SizedBox(height: 5.h),
                // ])
                //     : Container(),
                // data.receiverAddress3 != null
                //     ? Column(children: [
                //   Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: Text(
                //           'Receiver Address 3 :',
                //           style: TextStyle(
                //             fontSize: 12.sp,
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: Text(
                //           data.receiverAddress3.toString(),
                //           style: TextStyle(
                //             fontSize: 12.sp,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                //   SizedBox(height: 5.h),
                // ])
                //     : Container(),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver Post Code :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverZipCode.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver City :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverCity.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver State :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverState.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver Country :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverCountry.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver Phone :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverPhoneNbr.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver Phone 2 :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverPhoneNbr2.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Receiver Email :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.receiverEmailAddress.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // SizedBox(height: 5.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Expanded(
                //       child: Text(
                //         'Note :',
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: Text(
                //         data.note.toString(),
                //         style: TextStyle(
                //           fontSize: 12.sp,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
              ]
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}
