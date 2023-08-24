class AirWayBillArgs {

  late String awbNo;
  late String destination;
  late String product;
  late String bookingDate;
  late String service;
  late String insurance;
  late String insuranceAmount;
  late String insuranceValue;
  late String invoiceDate;
  late String invoiceNo;
  late String content;

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

  AirWayBillArgs.fromJson(Map<String, dynamic> json)
      :
        awbNo = json['awb_no'],
        destination = json['destination'],
        product = json['product'],
        bookingDate = json['booking_date'],
        service = json['service'],
        insurance = json['insurance'],
        insuranceAmount = json['insurance_amount'],
        insuranceValue = json['insurance_value'],
        invoiceDate = json['invoice_date'],
        invoiceNo = json['invoice_no'],
        content = json['content'];

  Map<String,dynamic> toJson() => {
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
