import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starlinex_courier/app/utils/app_toast.dart';
import 'package:starlinex_courier/data/arguments/shipper_args.dart';
import 'package:starlinex_courier/network/api/models/address_list_model.dart';
import 'package:starlinex_courier/network/api/requests/common_request.dart';

import '../app/app_repository.dart';
import '../app/utils/app_preference.dart';
import '../app/utils/app_strings.dart';
import '../network/api/api_response.dart';
import '../network/provider/service_locator.dart';

class ShipperDetailsController extends GetxController {

  var company = ''.obs;
  var personName = ''.obs;
  var address1 = ''.obs;
  var address2 = ''.obs;
  var address3 = ''.obs;
  var postCode = ''.obs;
  var city = ''.obs;
  var state = ''.obs;
  var phone = ''.obs;
  var email = ''.obs;
  var kycType = 'AADHAAR NUMBER'.obs;
  var kycNumber = ''.obs;
  var countryValue = 'INDIA'.obs;
  var countryCode = '+91'.obs;
  var document1 = ''.obs;
  var document2 = ''.obs;
  var kycList = [
    "PASSPORT NUMBER",
    "VOTER ID",
    "PAN NUMBER",
    "AADHAAR NUMBER",
    "AUTHORIZATION LETTER",
    "IEC CERTIFICATE",
    "OTHERS",
    "TAN NUMBER",
    "GSTIN (NORMAL)",
    "GSTIN (GOVT.)",
    "GSTIN (DIPLOMATS)",
    "TRN NO"
  ];
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
  late TextEditingController emailController;
  late TextEditingController kycController;


  @override
  void onInit() {
    getAddressList();
    initControllers();
    super.onInit();
  }

  String getActualNumber(String phoneNumber, List<Map<String, dynamic>> countries) {
    for (var country in countries) {
      String dialingCode = country['dial_code'];
      if (phoneNumber.startsWith(dialingCode)) {
        return phoneNumber.substring(dialingCode.length);
      }
    }
    return phoneNumber; // Return original if no matching country code is found
  }


  void showCountryList(BuildContext context) {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        countryValue.value = country.name.toUpperCase();
        countryCode.value = "+${country.phoneCode.toString()}";
      },
    );
  }

  Future<void> pickImageFromGallery(int type) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    try {
      if (type == 1) {
        document1.value = image!.path.toString();
      } else {
        document2.value = image!.path.toString();
      }
    } catch (e) {
      AppToast.showMessage(e.toString());
    }
  }

  void saveArgs() {
    args.value = ShipperArgs(
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
        email: email.value,
        kycType: kycType.value,
        kyuNumber: kycNumber.value,
        document1: document1.value,
        document2: document2.value
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
     countryCodeController=TextEditingController(text: countryCode.value);
     emailController=TextEditingController(text: email.value);
     kycController=TextEditingController(text: kycNumber.value);
     update();
  }


}
