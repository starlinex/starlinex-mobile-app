class ShipperArgs {

  late String company;
  late String personName;
  late String address1;
  late String address2;
  late String address3;
  late String postCode;
  late String city;
  late String state;
  late String country;
  late String phone;
  late String email;
  late String kycType;
  late String kyuNumber;
  late String document1;
  late String document2;

  ShipperArgs(
      {required this.company,
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
        required this.document1,
        required this.document2
      });
  ShipperArgs.fromJson(Map<String, dynamic> json)
      :
        company = json['company'],
        personName = json['person_name'],
        address1 = json['address1'],
        address2 = json['address2'],
        address3 = json['address3'],
        postCode = json['post_code'],
        city = json['city'],
        state = json['state'],
        country = json['country'],
        phone = json['phone'],
        email = json['email'],
        kycType = json['kyc_type'],
        kyuNumber = json['kyu_number'],
        document1 = json['document1'],
        document2 = json['document2'];

  Map<String,dynamic> toJson() => {
    'company': company,
    'person_name': personName,
    'address1': address1,
    'address2': address2,
    'address3': address3,
    'post_code': postCode,
    'city': city,
    'state': state,
    'country': country,
    'phone': phone,
    'email': email,
    'kyc_type': kycType,
    'kyu_number': kyuNumber,
    'document1': document1,
    'document2': document2,
  };
}
