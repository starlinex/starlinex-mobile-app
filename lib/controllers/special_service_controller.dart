import 'package:get/get.dart';
import 'package:starlinex_courier/data/arguments/special_service_args.dart';

class SpecialServiceController extends GetxController{

  var args=Rxn();
  var name=''.obs;
  var pcs=''.obs;
  var serviceList=RxList();
  var serviceItemsList=
  ["ARTIFICIAL JEWELLERY",'ELECTRONIC ITEMS','FOOD ITEMS','COSMETIC ITEMS','SIGNATURE REQUIRED','SPECIAL HANDLING'];

  void addList(){
    args.value = SpecialServiceArgs(
        name: name.toString(),
        pcs: pcs.toString(),
       );
    serviceList.add(args.value);
    serviceList.refresh();
  }

}