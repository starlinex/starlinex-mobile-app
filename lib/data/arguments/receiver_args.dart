class ReceiverArgs {

  String searchAddress;
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

  ReceiverArgs(
      {
        required this.searchAddress,
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
      });

  Map toJson() => {
    'search_address':searchAddress,
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
  };
}