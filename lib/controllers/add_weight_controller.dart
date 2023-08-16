import 'package:get/get.dart';

import '../data/arguments/weight_args.dart';

class AddWeightController extends GetxController{

  var actualWeight=0.obs;
  var lcm=0.obs;
  var bcm=0.obs;
  var hcm=0.obs;
  var hcmReadOnly=true.obs;
  var bcmReadOnly=true.obs;
  var volumetricWeight=0.0.obs;
  var args=Rxn();

  void calculateVolumetricWeight(){
    volumetricWeight.value=lcm.value*bcm.value*hcm.value/5000;
  }

  void saveArgs(){
     args.value = WeightArgs(actualWeight: actualWeight.toString(),
        lcm: lcm.toString(),
        bcm: bcm.toString(),
        hcm: hcm.toString(),
        volumetricWeight: volumetricWeight.toString());
  }
}