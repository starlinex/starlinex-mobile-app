import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/data/arguments/receiver_args.dart';

class ReceiverDetailsController extends GetxController {

  var countryValue=''.obs;
  var countryCode=''.obs;
  var search=''.obs;
  var company = ''.obs;
  var personName = ''.obs;
  var address1 = ''.obs;
  var address2 = ''.obs;
  var address3 = ''.obs;
  var postCode = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var phone = ''.obs;
  var phone2 = ''.obs;
  var email = ''.obs;
  var args = Rxn();



  void showCountryList(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        countryValue.value = country.name.toUpperCase();
        countryCode.value = "+${country.phoneCode.toString()}";
      },
    );
  }

  void saveArgs() {
    args.value = ReceiverArgs(
        searchAddress: search.value,
        company: company.value,
        personName: personName.value,
        address1: address1.value,
        address2: address2.value,
        address3: address3.value,
        postCode: postCode.value,
        city: city.value,
        state: state.value,
        country: countryValue.value,
        phone: countryCode+phone.value,
        phone2: countryCode+phone2.value,
        email: email.value,
    ).toJson();
  }

}
