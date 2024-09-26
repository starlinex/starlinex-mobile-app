class AddressListModel {
  int? responseCode;
  String? message;
  List<AddressListData>? response;

  AddressListModel({this.responseCode, this.message, this.response});

  AddressListModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['response'] != null) {
      response = <AddressListData>[];
      json['response'].forEach((v) {
        response!.add(new AddressListData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseCode'] = this.responseCode;
    data['message'] = this.message;
    if (this.response != null) {
      data['response'] = this.response!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AddressListData {

  String? fullAddress;
  Null? userId;
  Null? ycNbr;
  String? state;
  String? country;
  String? phoneNbr2;
  String? city;
  String? emailAddress;
  String? address3;
  String? kycType;
  String? kycNbr;
  String? phoneNbr;
  String? personName;
  String? company;
  String? address2;
  String? zipCode;
  String? address1;
  Null? addressBook;

  AddressListData(
      {this.fullAddress,
        this.userId,
        this.ycNbr,
        this.state,
        this.country,
        this.phoneNbr2,
        this.city,
        this.emailAddress,
        this.address3,
        this.kycType,
        this.kycNbr,
        this.phoneNbr,
        this.personName,
        this.company,
        this.address2,
        this.zipCode,
        this.address1,
        this.addressBook});

  AddressListData.fromJson(Map<String, dynamic> json) {
    fullAddress = json['fullAddress'];
    userId = json['userId'];
    ycNbr = json['ycNbr'];
    state = json['state'];
    country = json['country'];
    phoneNbr2 = json['phoneNbr2'];
    city = json['city'];
    emailAddress = json['emailAddress'];
    address3 = json['address3'];
    kycType = json['kycType'];
    kycNbr = json['kycNbr'];
    phoneNbr = json['phoneNbr'];
    personName = json['personName'];
    company = json['company'];
    address2 = json['address2'];
    zipCode = json['zipCode'];
    address1 = json['address1'];
    addressBook = json['addressBook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullAddress'] = this.fullAddress;
    data['userId'] = this.userId;
    data['ycNbr'] = this.ycNbr;
    data['state'] = this.state;
    data['country'] = this.country;
    data['phoneNbr2'] = this.phoneNbr2;
    data['city'] = this.city;
    data['emailAddress'] = this.emailAddress;
    data['address3'] = this.address3;
    data['kycType'] = this.kycType;
    data['kycNbr'] = this.kycNbr;
    data['phoneNbr'] = this.phoneNbr;
    data['personName'] = this.personName;
    data['company'] = this.company;
    data['address2'] = this.address2;
    data['zipCode'] = this.zipCode;
    data['address1'] = this.address1;
    data['addressBook'] = this.addressBook;
    return data;
  }
}
