class ShipmentItemModel {
  ShipmentItemModel({
      this.responseCode, 
      this.message, 
      this.response,});

  ShipmentItemModel.fromJson(dynamic json) {
    responseCode = json['responseCode'];
    message = json['message'];
    if (json['response'] != null) {
      response = [];
      json['response'].forEach((v) {
        response?.add(ShipmentItemData.fromJson(v));
      });
    }
  }
  num? responseCode;
  String? message;
  List<ShipmentItemData>? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['responseCode'] = responseCode;
    map['message'] = message;
    if (response != null) {
      map['response'] = response?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 4
/// itemDesc : "CHALIMIDI SWEET confectioneries. (For personal consumption)  Ingredient list as attached, All purpose flour,butter,cardamon powder,black pepper,cinnamon powder,sugar "
/// hsnCode : "17049020"

class ShipmentItemData {
  ShipmentItemData({
      this.id, 
      this.itemDesc, 
      this.hsnCode,});

  ShipmentItemData.fromJson(dynamic json) {
    id = json['id'];
    itemDesc = json['itemDesc'];
    hsnCode = json['hsnCode'];
  }
  num? id;
  String? itemDesc;
  String? hsnCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['itemDesc'] = itemDesc;
    map['hsnCode'] = hsnCode;
    return map;
  }

}