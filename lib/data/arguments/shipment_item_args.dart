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
    'box_no': boxNo,
    'description': description,
    'hs_code': hsCode,
    'unit_type': unitType,
    'quantity': quantity,
    'unit_weight': unitWeight,
    'igst': igst,
    'unit_rates': unitRates,
    'amount': amount,
  };
}
