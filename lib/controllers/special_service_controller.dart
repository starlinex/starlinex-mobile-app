import 'package:get/get.dart';
import 'package:starlinex_courier/data/arguments/special_service_args.dart';

class SpecialServiceController extends GetxController{

  var args=Rxn();
  var name='Food Items'.obs;
  var pcs='1'.obs;
  var serviceItemsList=
  ["ARTIFICIAL JEWELLERY",'ELECTRONIC ITEMS','FOOD ITEMS','COSMETIC ITEMS','SIGNATURE REQUIRED','SPECIAL HANDLING'];
  var serviceList=[].obs;


  void saveArgs(){
    args.value = SpecialServiceArgs(
        name: name.toString(),
        pcs: pcs.toString(),
       );
  }

}