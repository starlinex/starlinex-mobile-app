/// responseCode : 200
/// message : "Success"
/// response : [{"userId":1,"awbNbr":"test","destination":"xyz","product":"abc","bookingDate":"2023-03-21","insurance":false,"service":"cvb","shipmentValue":"15","invoiceDate":"2023-03-21","invoiceNbr":"qwert","content":"zxc","shipperPersonName":"abc","shipperAddress1":"abc","shipperAddress2":"abc","shipperAddress3":"abc","shipperZipCode":"abc","shipperCity":"abc","shipperState":"abc","shipperPhoneNbr":"abc","shipperEmailAddress":"abc","shipperKycType":"abc","shipperKycNbr":"abc","shipperKycDoc":null,"receiverAddressBook":"abc","receiverCompany":"abc","receiverPersonName":"abc","receiverAddress1":"abc","receiverAddress2":"abc","receiverAddress3":"abc","receiverZipCode":"abc","receiverCity":"abc","receiverCountry":"abc","receiverState":"abc","receiverPhoneNbr":"abc","receiverPhoneNbr2":"abc","receiverEmailAddress":"abc","pcs":"abc","actualWeight":"abc","volumetricWeight":"abc","consignerWeight":"abc","chargeableWeight":"abc","parcelNo":"abc","chargeableEt":"abc","invoiceType":"abc","incoterms":"abc","note":"abc","descNote":"abc","shipmentDetailsList":[{"userId":null,"shipmentBoxNo":"abc","shipmentDescription":"abc","shipmentHsCode":"abc","shipmentUnityType":"abc","shipmentQuantity":"abc","shipmentUnitWeight":"abc","shipmentIgst":"abc","shipmentUnitRates":"abc","shipmentAmount":"abc"},{"userId":null,"shipmentBoxNo":"abc","shipmentDescription":"abc","shipmentHsCode":"abc","shipmentUnityType":"abc","shipmentQuantity":"abc","shipmentUnitWeight":"abc","shipmentIgst":"abc","shipmentUnitRates":"abc","shipmentAmount":"abc"}],"specialServices":[{"userId":null,"specialServiceName":"abc","specialServicePcs":"abc"},{"userId":null,"specialServiceName":"abc","specialServicePcs":"abc"}],"weightAndDimensions":[{"userId":null,"boxNo":null,"actualWt":"abc","lcm":"abc","bcm":"abc","hcm":"abc","volumetricWt":"abc"},{"userId":null,"boxNo":null,"actualWt":"abc","lcm":"abc","bcm":"abc","hcm":"abc","volumetricWt":"abc"}]}]

class StoreAirwayInfoModel {
  StoreAirwayInfoModel({
      this.responseCode, 
      this.message, 
      this.response,});

  StoreAirwayInfoModel.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(StoreAirwayData.fromJson(v));
      });
    }
  }
  num? responseCode;
  String? message;
  List<StoreAirwayData>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['message'] = message;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// userId : 1
/// awbNbr : "test"
/// destination : "xyz"
/// product : "abc"
/// bookingDate : "2023-03-21"
/// insurance : false
/// service : "cvb"
/// shipmentValue : "15"
/// invoiceDate : "2023-03-21"
/// invoiceNbr : "qwert"
/// content : "zxc"
/// shipperPersonName : "abc"
/// shipperAddress1 : "abc"
/// shipperAddress2 : "abc"
/// shipperAddress3 : "abc"
/// shipperZipCode : "abc"
/// shipperCity : "abc"
/// shipperState : "abc"
/// shipperPhoneNbr : "abc"
/// shipperEmailAddress : "abc"
/// shipperKycType : "abc"
/// shipperKycNbr : "abc"
/// shipperKycDoc : null
/// receiverAddressBook : "abc"
/// receiverCompany : "abc"
/// receiverPersonName : "abc"
/// receiverAddress1 : "abc"
/// receiverAddress2 : "abc"
/// receiverAddress3 : "abc"
/// receiverZipCode : "abc"
/// receiverCity : "abc"
/// receiverCountry : "abc"
/// receiverState : "abc"
/// receiverPhoneNbr : "abc"
/// receiverPhoneNbr2 : "abc"
/// receiverEmailAddress : "abc"
/// pcs : "abc"
/// actualWeight : "abc"
/// volumetricWeight : "abc"
/// consignerWeight : "abc"
/// chargeableWeight : "abc"
/// parcelNo : "abc"
/// chargeableEt : "abc"
/// invoiceType : "abc"
/// incoterms : "abc"
/// note : "abc"
/// descNote : "abc"
/// shipmentDetailsList : [{"userId":null,"shipmentBoxNo":"abc","shipmentDescription":"abc","shipmentHsCode":"abc","shipmentUnityType":"abc","shipmentQuantity":"abc","shipmentUnitWeight":"abc","shipmentIgst":"abc","shipmentUnitRates":"abc","shipmentAmount":"abc"},{"userId":null,"shipmentBoxNo":"abc","shipmentDescription":"abc","shipmentHsCode":"abc","shipmentUnityType":"abc","shipmentQuantity":"abc","shipmentUnitWeight":"abc","shipmentIgst":"abc","shipmentUnitRates":"abc","shipmentAmount":"abc"}]
/// specialServices : [{"userId":null,"specialServiceName":"abc","specialServicePcs":"abc"},{"userId":null,"specialServiceName":"abc","specialServicePcs":"abc"}]
/// weightAndDimensions : [{"userId":null,"boxNo":null,"actualWt":"abc","lcm":"abc","bcm":"abc","hcm":"abc","volumetricWt":"abc"},{"userId":null,"boxNo":null,"actualWt":"abc","lcm":"abc","bcm":"abc","hcm":"abc","volumetricWt":"abc"}]

class StoreAirwayData {
  StoreAirwayData({
      this.userId, 
      this.awbNbr, 
      this.destination, 
      this.product, 
      this.bookingDate, 
      this.insurance, 
      this.service, 
      this.shipmentValue, 
      this.invoiceDate, 
      this.invoiceNbr, 
      this.content, 
      this.shipperPersonName, 
      this.shipperAddress1, 
      this.shipperAddress2, 
      this.shipperAddress3, 
      this.shipperZipCode, 
      this.shipperCity, 
      this.shipperState, 
      this.shipperPhoneNbr, 
      this.shipperEmailAddress, 
      this.shipperKycType, 
      this.shipperKycNbr, 
      this.shipperKycDoc, 
      this.receiverAddressBook, 
      this.receiverCompany, 
      this.receiverPersonName, 
      this.receiverAddress1, 
      this.receiverAddress2, 
      this.receiverAddress3, 
      this.receiverZipCode, 
      this.receiverCity, 
      this.receiverCountry, 
      this.receiverState, 
      this.receiverPhoneNbr, 
      this.receiverPhoneNbr2, 
      this.receiverEmailAddress, 
      this.pcs, 
      this.actualWeight, 
      this.volumetricWeight, 
      this.consignerWeight, 
      this.chargeableWeight, 
      this.parcelNo, 
      this.chargeableEt, 
      this.invoiceType, 
      this.incoterms, 
      this.note, 
      this.descNote, 
      this.shipmentDetailsList, 
      this.specialServices, 
      this.weightAndDimensions,});

  StoreAirwayData.fromJson(dynamic json) {
    userId = json['userId'];
    awbNbr = json['awbNbr'];
    destination = json['destination'];
    product = json['product'];
    bookingDate = json['bookingDate'];
    insurance = json['insurance'];
    service = json['service'];
    shipmentValue = json['shipmentValue'];
    invoiceDate = json['invoiceDate'];
    invoiceNbr = json['invoiceNbr'];
    content = json['content'];
    shipperPersonName = json['shipperPersonName'];
    shipperAddress1 = json['shipperAddress1'];
    shipperAddress2 = json['shipperAddress2'];
    shipperAddress3 = json['shipperAddress3'];
    shipperZipCode = json['shipperZipCode'];
    shipperCity = json['shipperCity'];
    shipperState = json['shipperState'];
    shipperPhoneNbr = json['shipperPhoneNbr'];
    shipperEmailAddress = json['shipperEmailAddress'];
    shipperKycType = json['shipperKycType'];
    shipperKycNbr = json['shipperKycNbr'];
    shipperKycDoc = json['shipperKycDoc'];
    receiverAddressBook = json['receiverAddressBook'];
    receiverCompany = json['receiverCompany'];
    receiverPersonName = json['receiverPersonName'];
    receiverAddress1 = json['receiverAddress1'];
    receiverAddress2 = json['receiverAddress2'];
    receiverAddress3 = json['receiverAddress3'];
    receiverZipCode = json['receiverZipCode'];
    receiverCity = json['receiverCity'];
    receiverCountry = json['receiverCountry'];
    receiverState = json['receiverState'];
    receiverPhoneNbr = json['receiverPhoneNbr'];
    receiverPhoneNbr2 = json['receiverPhoneNbr2'];
    receiverEmailAddress = json['receiverEmailAddress'];
    pcs = json['pcs'];
    actualWeight = json['actualWeight'];
    volumetricWeight = json['volumetricWeight'];
    consignerWeight = json['consignerWeight'];
    chargeableWeight = json['chargeableWeight'];
    parcelNo = json['parcelNo'];
    chargeableEt = json['chargeableEt'];
    invoiceType = json['invoiceType'];
    incoterms = json['incoterms'];
    note = json['note'];
    descNote = json['descNote'];
    if (json['shipmentDetailsList'] != null) {
      shipmentDetailsList = [];
      json['shipmentDetailsList'].forEach((v) {
        shipmentDetailsList?.add(ShipmentDetailsList.fromJson(v));
      });
    }
    if (json['specialServices'] != null) {
      specialServices = [];
      json['specialServices'].forEach((v) {
        specialServices?.add(SpecialServices.fromJson(v));
      });
    }
    if (json['weightAndDimensions'] != null) {
      weightAndDimensions = [];
      json['weightAndDimensions'].forEach((v) {
        weightAndDimensions?.add(WeightAndDimensions.fromJson(v));
      });
    }
  }
  num? userId;
  String? awbNbr;
  String? destination;
  String? product;
  String? bookingDate;
  bool? insurance;
  String? service;
  String? shipmentValue;
  String? invoiceDate;
  String? invoiceNbr;
  String? content;
  String? shipperPersonName;
  String? shipperAddress1;
  String? shipperAddress2;
  String? shipperAddress3;
  String? shipperZipCode;
  String? shipperCity;
  String? shipperState;
  String? shipperPhoneNbr;
  String? shipperEmailAddress;
  String? shipperKycType;
  String? shipperKycNbr;
  dynamic shipperKycDoc;
  String? receiverAddressBook;
  String? receiverCompany;
  String? receiverPersonName;
  String? receiverAddress1;
  String? receiverAddress2;
  String? receiverAddress3;
  String? receiverZipCode;
  String? receiverCity;
  String? receiverCountry;
  String? receiverState;
  String? receiverPhoneNbr;
  String? receiverPhoneNbr2;
  String? receiverEmailAddress;
  String? pcs;
  String? actualWeight;
  String? volumetricWeight;
  String? consignerWeight;
  String? chargeableWeight;
  String? parcelNo;
  String? chargeableEt;
  String? invoiceType;
  String? incoterms;
  String? note;
  String? descNote;
  List<ShipmentDetailsList>? shipmentDetailsList;
  List<SpecialServices>? specialServices;
  List<WeightAndDimensions>? weightAndDimensions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['awbNbr'] = awbNbr;
    map['destination'] = destination;
    map['product'] = product;
    map['bookingDate'] = bookingDate;
    map['insurance'] = insurance;
    map['service'] = service;
    map['shipmentValue'] = shipmentValue;
    map['invoiceDate'] = invoiceDate;
    map['invoiceNbr'] = invoiceNbr;
    map['content'] = content;
    map['shipperPersonName'] = shipperPersonName;
    map['shipperAddress1'] = shipperAddress1;
    map['shipperAddress2'] = shipperAddress2;
    map['shipperAddress3'] = shipperAddress3;
    map['shipperZipCode'] = shipperZipCode;
    map['shipperCity'] = shipperCity;
    map['shipperState'] = shipperState;
    map['shipperPhoneNbr'] = shipperPhoneNbr;
    map['shipperEmailAddress'] = shipperEmailAddress;
    map['shipperKycType'] = shipperKycType;
    map['shipperKycNbr'] = shipperKycNbr;
    map['shipperKycDoc'] = shipperKycDoc;
    map['receiverAddressBook'] = receiverAddressBook;
    map['receiverCompany'] = receiverCompany;
    map['receiverPersonName'] = receiverPersonName;
    map['receiverAddress1'] = receiverAddress1;
    map['receiverAddress2'] = receiverAddress2;
    map['receiverAddress3'] = receiverAddress3;
    map['receiverZipCode'] = receiverZipCode;
    map['receiverCity'] = receiverCity;
    map['receiverCountry'] = receiverCountry;
    map['receiverState'] = receiverState;
    map['receiverPhoneNbr'] = receiverPhoneNbr;
    map['receiverPhoneNbr2'] = receiverPhoneNbr2;
    map['receiverEmailAddress'] = receiverEmailAddress;
    map['pcs'] = pcs;
    map['actualWeight'] = actualWeight;
    map['volumetricWeight'] = volumetricWeight;
    map['consignerWeight'] = consignerWeight;
    map['chargeableWeight'] = chargeableWeight;
    map['parcelNo'] = parcelNo;
    map['chargeableEt'] = chargeableEt;
    map['invoiceType'] = invoiceType;
    map['incoterms'] = incoterms;
    map['note'] = note;
    map['descNote'] = descNote;
    if (shipmentDetailsList != null) {
      map['shipmentDetailsList'] = shipmentDetailsList?.map((v) => v.toJson()).toList();
    }
    if (specialServices != null) {
      map['specialServices'] = specialServices?.map((v) => v.toJson()).toList();
    }
    if (weightAndDimensions != null) {
      map['weightAndDimensions'] = weightAndDimensions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// userId : null
/// boxNo : null
/// actualWt : "abc"
/// lcm : "abc"
/// bcm : "abc"
/// hcm : "abc"
/// volumetricWt : "abc"

class WeightAndDimensions {
  WeightAndDimensions({
      this.userId, 
      this.boxNo, 
      this.actualWt, 
      this.lcm, 
      this.bcm, 
      this.hcm, 
      this.volumetricWt,});

  WeightAndDimensions.fromJson(dynamic json) {
    userId = json['userId'];
    boxNo = json['boxNo'];
    actualWt = json['actualWt'];
    lcm = json['lcm'];
    bcm = json['bcm'];
    hcm = json['hcm'];
    volumetricWt = json['volumetricWt'];
  }
  dynamic userId;
  dynamic boxNo;
  String? actualWt;
  String? lcm;
  String? bcm;
  String? hcm;
  String? volumetricWt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['boxNo'] = boxNo;
    map['actualWt'] = actualWt;
    map['lcm'] = lcm;
    map['bcm'] = bcm;
    map['hcm'] = hcm;
    map['volumetricWt'] = volumetricWt;
    return map;
  }

}

/// userId : null
/// specialServiceName : "abc"
/// specialServicePcs : "abc"

class SpecialServices {
  SpecialServices({
      this.userId, 
      this.specialServiceName, 
      this.specialServicePcs,});

  SpecialServices.fromJson(dynamic json) {
    userId = json['userId'];
    specialServiceName = json['specialServiceName'];
    specialServicePcs = json['specialServicePcs'];
  }
  dynamic userId;
  String? specialServiceName;
  String? specialServicePcs;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['specialServiceName'] = specialServiceName;
    map['specialServicePcs'] = specialServicePcs;
    return map;
  }

}

/// userId : null
/// shipmentBoxNo : "abc"
/// shipmentDescription : "abc"
/// shipmentHsCode : "abc"
/// shipmentUnityType : "abc"
/// shipmentQuantity : "abc"
/// shipmentUnitWeight : "abc"
/// shipmentIgst : "abc"
/// shipmentUnitRates : "abc"
/// shipmentAmount : "abc"

class ShipmentDetailsList {
  ShipmentDetailsList({
      this.userId, 
      this.shipmentBoxNo, 
      this.shipmentDescription, 
      this.shipmentHsCode, 
      this.shipmentUnityType, 
      this.shipmentQuantity, 
      this.shipmentUnitWeight, 
      this.shipmentIgst, 
      this.shipmentUnitRates, 
      this.shipmentAmount,});

  ShipmentDetailsList.fromJson(dynamic json) {
    userId = json['userId'];
    shipmentBoxNo = json['shipmentBoxNo'];
    shipmentDescription = json['shipmentDescription'];
    shipmentHsCode = json['shipmentHsCode'];
    shipmentUnityType = json['shipmentUnityType'];
    shipmentQuantity = json['shipmentQuantity'];
    shipmentUnitWeight = json['shipmentUnitWeight'];
    shipmentIgst = json['shipmentIgst'];
    shipmentUnitRates = json['shipmentUnitRates'];
    shipmentAmount = json['shipmentAmount'];
  }
  dynamic userId;
  String? shipmentBoxNo;
  String? shipmentDescription;
  String? shipmentHsCode;
  String? shipmentUnityType;
  String? shipmentQuantity;
  String? shipmentUnitWeight;
  String? shipmentIgst;
  String? shipmentUnitRates;
  String? shipmentAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['shipmentBoxNo'] = shipmentBoxNo;
    map['shipmentDescription'] = shipmentDescription;
    map['shipmentHsCode'] = shipmentHsCode;
    map['shipmentUnityType'] = shipmentUnityType;
    map['shipmentQuantity'] = shipmentQuantity;
    map['shipmentUnitWeight'] = shipmentUnitWeight;
    map['shipmentIgst'] = shipmentIgst;
    map['shipmentUnitRates'] = shipmentUnitRates;
    map['shipmentAmount'] = shipmentAmount;
    return map;
  }

}