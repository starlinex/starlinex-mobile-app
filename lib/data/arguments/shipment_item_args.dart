class ShipmentItemArgs {
  String boxNo;
  String description;
  String hsCode;
  String unitType;
  String quantity;
  String unitWeight;
  String igst;
  String unitRates;
  String amount;

  ShipmentItemArgs(
      {required this.boxNo,
        required this.description,
        required this.hsCode,
        required this.unitType,
        required this.quantity,
        required this.unitWeight,
        required this.igst,
        required this.unitRates,
        required this.amount
      });

  Map toJson() => {
    'shipmentBoxNo': boxNo,
    'shipmentDescription': description,
    'shipmentHsCode': hsCode,
    'shipmentUnityType': unitType,
    'shipmentQuantity': quantity,
    'shipmentUnitWeight': unitWeight,
    'shipmentIgst': igst,
    'shipmentUnitRates': unitRates,
    'shipmentAmount': amount,
  };
}
