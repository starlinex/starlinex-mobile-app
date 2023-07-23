class ShipperArgs {

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
  String document1;
  String document2;

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

  Map toJson() => {
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
