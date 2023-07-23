import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starlinex_courier/app/utils/app_toast.dart';
import 'package:starlinex_courier/data/arguments/shipper_args.dart';

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
  var countryValue = ''.obs;
  var countryCode = ''.obs;
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


}
