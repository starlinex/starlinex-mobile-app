class AirWayBillArgs {

  String awbNo;
  String destination;
  String product;
  String bookingDate;
  String service;
  String insurance;
  String insuranceAmount;
  String insuranceValue;
  String invoiceDate;
  String invoiceNo;
  String content;

  AirWayBillArgs(
      {required this.awbNo,
        required this.destination,
        required this.product,
        required this.bookingDate,
        required this.service,
        required this.insurance,
        required this.insuranceAmount,
        required this.insuranceValue,
        required this.invoiceDate,
        required this.invoiceNo,
        required this.content
      });

  Map toJson() => {
    'awb_no': awbNo,
    'destination': destination,
    'product': product,
    'booking_date': bookingDate,
    'service': service,
    'insurance': insurance,
    'insurance_amount': insuranceAmount,
    'insurance_value': insuranceValue,
    'invoice_date': invoiceDate,
    'invoice_no': invoiceNo,
    'content': content,
  };
}
