import 'package:get/get.dart';
import 'package:starlinex_courier/data/arguments/shipment_item_args.dart';
import 'package:starlinex_courier/network/api/models/shipment_item_model.dart';
import 'package:starlinex_courier/network/api/requests/common_request.dart';

import '../app/app_repository.dart';
import '../network/api/api_response.dart';
import '../network/provider/service_locator.dart';

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
  ApiResponse<ShipmentItemModel>? shipmentListData;

  var boxNo = '1'.obs;
  var description = ''.obs;
  var hsCode = "".obs;
  var unitType = 'Pc'.obs;
  var quantity = 0.obs;
  var unitWeight = ''.obs;
  var igst = ''.obs;
  var unitRate = 0.obs;
  var amount = 0.obs;
  var args = Rxn();
  var search=''.obs;


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

  @override
  void onInit() {
    searchShipmentItem('A');
    super.onInit();
  }

  Future<ApiResponse<ShipmentItemModel>?> searchShipmentItem(String search) async {
    var request=CommonRequest(search: search);
    var response=await locator<AppRepository>().searchShipmentItem(request);
    if(response.isSuccess()){
      shipmentListData= ApiResponse.success(response.data());
    }else{
      shipmentListData= ApiResponse.error(response.error());
    }
    update();
    return null;
  }

}