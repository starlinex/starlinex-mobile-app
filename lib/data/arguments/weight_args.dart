class WeightArgs {
  String actualWeight;
  String lcm;
  String bcm;
  String hcm;
  String volumetricWeight;

  WeightArgs(
      {required this.actualWeight,
      required this.lcm,
      required this.bcm,
      required this.hcm,
      required this.volumetricWeight});

  Map toJson() => {
    'actual_weight': actualWeight,
    'lcm': lcm,
    'bcm': bcm,
    'hcm': hcm,
    'volumetric_weight': volumetricWeight,
  };
}
