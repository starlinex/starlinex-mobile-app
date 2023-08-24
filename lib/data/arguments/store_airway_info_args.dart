///RESPONSE FORMAT:

/// {
/// "awbNbr": "2379546351",
/// "bookingDate": "2023-08-24",
/// "content": "uyio",
/// "descNote": "UNSOLICITED GIFT SENT TO MY FRIENDS & FAMILY MEMBERS FOR THERE PERSONAL USE ONLY",
/// "destination": "ANDORRA",
/// "incoterms": "CFR",
/// "insurance": "false",
/// "insuranceAmt": "3",
/// "insuranceValue": "34",
/// "invoiceDate": "2023-08-30",
/// "invoiceNbr": "567",
/// "invoiceType": "Invoice",
/// "note": "GIFT",
/// "product": "fihfiueh",
/// "receiverAddress1": "pipoip",
/// "receiverAddress2": "ipi",
/// "receiverAddress3": "pipo",
/// "receiverAddressBook": "joijij",
/// "receiverCity": "iopipipip",
/// "receiverCompany": "oiooip",
/// "receiverCountry": "ANGUILLA",
/// "receiverEmailAddress": "jijiojoij",
/// "receiverPersonName": "ipipipi",
/// "receiverPhoneNbr": "+1456789",
/// "receiverPhoneNbr2": "+1456789",
/// "receiverState": "ioiojsodo",
/// "receiverZipCode": "56789",
/// "service": "REST OF NEW ZEALAND NZR",
/// "shipmentDetailsList": [
/// {
/// "shipmentAmount": "100",
/// "shipmentBoxNo": "1",
/// "shipmentDescription": "ADOPTER",
/// "shipmentHsCode": "85369090",
/// "shipmentIgst": "10",
/// "shipmentQuantity": "10",
/// "shipmentUnitRates": "10",
/// "shipmentUnitWeight": "10",
/// "shipmentUnityType": "Pc"
/// }
/// ],
/// "shipperAddress1": "ojoj",
/// "shipperAddress2": "ojo",
/// "shipperAddress3": "o",
/// "shipperCity": "jo",
/// "shipperCompany": "ihihj",
/// "shipperCountry": "ANGOLA",
/// "shipperEmailAddress": "jijiojoij",
/// "shipperKycNbr": "56789",
/// "shipperKycType": "AADHAAR NUMBER",
/// "shipperPersonName": "joij",
/// "shipperPhoneNbr": "+24456789",
/// "shipperState": "j",
/// "shipperZipCode": "jo",
/// "specialServices": [
/// {
/// "specialServiceName": "Food Items",
/// "specialServicePcs": "1"
/// }
/// ],
/// "userId": 1,
/// "weightAndDimensions": [
/// {
/// "actualWt": "10",
/// "bcm": "10",
/// "hcm": "10",
/// "lcm": "10",
/// "volumetricWt": "0.2"
/// }
/// ]
/// }


class StoreAirwayInfoArgs {

  int userId;
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
  String company;
  String personName;
  String address1;
  String address2;
  String address3;
  String postCode;
  String city;
  String state;
  String country;
  String phone;
  String email;
  String kycType;
  String kyuNumber;
  String searchAddress;
  String rCompany;
  String rPersonName;
  String rAddress1;
  String rAddress2;
  String rAddress3;
  String rPostCode;
  String rCity;
  String rState;
  String rCountry;
  String rPhone;
  String rPhone2;
  String rEmail;
  String invoiceType;
  String incoTerms;
  String note;
  String noteText;
  String actualTotalWeight;
  String volumetricTotalWeight;
  String shipperTotalWeight;
  String shipperTotalAmount;
  dynamic weightList;
  dynamic serviceList;
  dynamic shipmentItemsList;

  StoreAirwayInfoArgs(
      {
        required this.userId,
        required this.awbNo,
        required this.destination,
        required this.product,
        required this.bookingDate,
        required this.service,
        required this.insurance,
        required this.insuranceAmount,
        required this.insuranceValue,
        required this.invoiceDate,
        required this.invoiceNo,
        required this.content,
        required this.company,
        required this.personName,
        required this.address1,
        required this.address2,
        required this.address3,
        required this.postCode,
        required this.city,
        required this.state,
        required this.country,
        required this.phone,
        required this.email,
        required this.kycType,
        required this.kyuNumber,
        required this.searchAddress,
        required this.rCompany,
        required this.rPersonName,
        required this.rAddress1,
        required this.rAddress2,
        required this.rAddress3,
        required this.rPostCode,
        required this.rCity,
        required this.rState,
        required this.rCountry,
        required this.rPhone,
        required this.rPhone2,
        required this.rEmail,
        required this.invoiceType,
        required this.incoTerms,
        required this.note,
        required this.noteText,
        required this.actualTotalWeight,
        required this.volumetricTotalWeight,
        required this.shipperTotalWeight,
        required this.shipperTotalAmount,
        required this.weightList,
        required this.serviceList,
        required this.shipmentItemsList,
      });

  Map toJson() => {
    'userId': userId,
    'awbNbr': awbNo,
    'destination': destination,
    'product': product,
    'bookingDate': bookingDate,
    'service': service,
    'insurance': insurance,
    'insuranceAmt': insuranceAmount,
    'insuranceValue': insuranceValue,
    'invoiceDate': invoiceDate,
    'invoiceNbr': invoiceNo,
    'content': content,
    'shipperCompany': company,
    'shipperPersonName': personName,
    'shipperAddress1': address1,
    'shipperAddress2': address2,
    'shipperAddress3': address3,
    'shipperZipCode': postCode,
    'shipperCity': city,
    'shipperState': state,
    'shipperCountry': country,
    'shipperPhoneNbr': phone,
    'shipperEmailAddress': email,
    'shipperKycType': kycType,
    'shipperKycNbr': kyuNumber,
    'receiverAddressBook':searchAddress,
    'receiverCompany': rCompany,
    'receiverPersonName': rPersonName,
    'receiverAddress1': rAddress1,
    'receiverAddress2': rAddress2,
    'receiverAddress3': rAddress3,
    'receiverZipCode': rPostCode,
    'receiverCity': rCity,
    'receiverState': rState,
    'receiverCountry': rCountry,
    'receiverPhoneNbr': rPhone,
    'receiverPhoneNbr2': rPhone2,
    'receiverEmailAddress': email,
    'invoiceType': invoiceType,
    'incoterms': incoTerms,
    'note': note,
    'descNote': noteText,
    'actualWeight': actualTotalWeight,
    'volumetricWeight': volumetricTotalWeight,
    'consignerWeight': shipperTotalWeight,
    'consignerAmount': shipperTotalAmount,
    'weightAndDimensions': weightList,
    'specialServices': serviceList,
    'shipmentDetailsList': shipmentItemsList,
  };
}
