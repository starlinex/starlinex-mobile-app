import 'dart:typed_data';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/widgets.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';

Future<Uint8List> makePdf(BookingHistoryData data) async {
  final pdf = Document();
  pdf.addPage(
    Page(
      margin: EdgeInsets.symmetric(horizontal: 50.w,vertical: 10.h),
      build: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('STARLINEX INVOICE',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontBold: Font.timesBoldItalic()
                  )
              )
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'AWB NO. :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.awbNbr.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Destination :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.destination.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Product :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.product.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Booking Date :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.bookingDate.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Service :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.service.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Insurance :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.insurance.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            data.insurance==true?
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Insurance Amount :',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.insuranceAmt.toString(),
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Insurance Value :',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.insuranceValue.toString(),
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                  ]
                )
                :Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Invoice Date :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.invoiceDate.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Invoice No. :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.invoiceNbr.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Content :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.content.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper Company :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperCompany.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper Person Name :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperPersonName.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper Address 1 :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperAddress1.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            data.shipperAddress2!=null?
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Shipper Address 2 :',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.shipperAddress2.toString(),
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                  ]
                ):Container(),
            data.shipperAddress3!=null?
            Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Shipper Address 3 :',
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data.shipperAddress3.toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                ]
            ):Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper Post Code :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperZipCode.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper City :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperCity.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper State :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperState.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper Country :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperCountry.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper Phone :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperPhoneNbr.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper Email :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperEmailAddress.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper KYC Type :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperKycType.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Shipper KYC No. :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.shipperKycNbr.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Address Book :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverAddressBook.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver Company :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverCompany.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver Person Name :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverPersonName.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver Address 1 :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverAddress1.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            data.receiverAddress2!=null?
            Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Receiver Address 2 :',
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data.receiverAddress2.toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                ]
            ):Container(),
            data.receiverAddress3!=null?
            Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Receiver Address 3 :',
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          data.receiverAddress3.toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                ]
            ):Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver Post Code :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverZipCode.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver City :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverCity.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver State :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverState.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver Country :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverCountry.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver Phone :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverPhoneNbr.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver Phone 2 :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverPhoneNbr2.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Receiver Email :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.receiverEmailAddress.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Note :',
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    data.note.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ),
  );
  return pdf.save();
}


