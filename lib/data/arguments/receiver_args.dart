class ReceiverArgs {

  late String searchAddress;
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
  late String phone2;
  late String email;

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
        required this.phone2,
        required this.email,
      });

  ReceiverArgs.fromJson(Map<String, dynamic> json)
      :
        searchAddress = json['search_address'],
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
        phone2 = json['phone2'],
        email = json['email'];

  Map<String,dynamic> toJson() => {
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
    'phone2': phone2,
    'email': email,
  };

}