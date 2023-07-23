import 'package:get/get.dart';
import 'package:starlinex_courier/data/arguments/shipment_item_args.dart';

class AddShipmentItemController extends GetxController {

  var unitTypeList = [
    "Pkt",
    "Pc",
    "PCS",
    "Nos",
    "Bottle",
    "Pair",
    "Strip",
    "Dozen",
    "Gross",
    "Sets",
    "Box",
    "KG",
    "Gram",
    "Container"
  ];

  var boxNo = '1'.obs;
  var description = 'Base Metal Anklet'.obs;
  var hsCode = "".obs;
  var unitType = 'Pc'.obs;
  var quantity = 0.obs;
  var unitWeight = ''.obs;
  var igst = ''.obs;
  var unitRate = 0.obs;
  var amount = 0.obs;
  var args = Rxn();


  void calculateAmount() {
    amount.value = quantity.value * unitRate.value;
  }

  void saveArgs() {
    args.value = ShipmentItemArgs(boxNo: boxNo.value,
        description: description.value,
        hsCode: hsCode.value,
        unitType: unitType.value,
        quantity: quantity.value.toString(),
        unitWeight: unitWeight.value,
        igst: igst.value,
        unitRates: unitRate.value.toString(),
        amount: amount.value.toString());
  }

}