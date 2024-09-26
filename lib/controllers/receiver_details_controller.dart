import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlinex_courier/data/arguments/receiver_args.dart';

import '../app/app_repository.dart';
import '../app/utils/app_preference.dart';
import '../app/utils/app_strings.dart';
import '../network/api/api_response.dart';
import '../network/api/models/address_list_model.dart';
import '../network/api/requests/common_request.dart';
import '../network/provider/service_locator.dart';

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
  var fullAddress="Choose Address".obs;
  ApiResponse<AddressListModel>? addressListData;
  late TextEditingController companyController;
  late TextEditingController personController;
  late TextEditingController address1Controller;
  late TextEditingController address2Controller;
  late TextEditingController address3Controller;
  late TextEditingController zipCodeController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController countryController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneController;
  late TextEditingController phone2Controller;
  late TextEditingController emailController;


  @override
  void onInit() {
    getAddressList();
    initControllers();
    super.onInit();
  }

  void showCountryList(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        countryValue.value = country.name.toUpperCase();
        countryCode.value = "+${country.phoneCode.toString()}";
        countryController.text=countryValue.value;
        update();
      },
    );
  }

  String getActualPhone(String phoneNumber, List<Map<String, dynamic>> countries) {
    for (var country in countries) {
      String dialingCode = country['dial_code'];
      if (phoneNumber.startsWith(dialingCode)) {
        countryCode.value=dialingCode;
        return phoneNumber.substring(dialingCode.length);
      }
    }
    return phoneNumber; // Return original if no matching country code is found
  }

  String getActualPhoneTwo(String phoneNumber, List<Map<String, dynamic>> countries) {
    for (var country in countries) {
      String dialingCode = country['dial_code'];
      if (phoneNumber.startsWith(dialingCode)) {
        return phoneNumber.substring(dialingCode.length);
      }
    }
    return phoneNumber; // Return original if no matching country code is found
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

  Future<ApiResponse<AddressListModel>?> getAddressList() async {
    String userId=AppPreference.getString(AppStrings.userId).toString();
    var request=CommonRequest(userId: userId,search: "");
    var response=await locator<AppRepository>().getAddressList(request);
    if(response.isSuccess()){
      addressListData= ApiResponse.success(response.data());
    }else{
      addressListData= ApiResponse.error(response.error());
    }
    update();
    return null;
  }

  void initControllers() {
    companyController=TextEditingController(text: company.value);
    personController=TextEditingController(text: personName.value);
    address1Controller=TextEditingController(text: address1.value);
    address2Controller=TextEditingController(text: address2.value);
    address3Controller=TextEditingController(text: address3.value);
    zipCodeController=TextEditingController(text: postCode.value);
    cityController=TextEditingController(text: city.value);
    stateController=TextEditingController(text: state.value);
    countryController=TextEditingController(text: countryValue.value);
    phoneController=TextEditingController(text: phone.value);
    phone2Controller=TextEditingController(text: phone2.value);
    countryCodeController=TextEditingController(text: countryCode.value);
    emailController=TextEditingController(text: email.value);
    update();
  }

}
