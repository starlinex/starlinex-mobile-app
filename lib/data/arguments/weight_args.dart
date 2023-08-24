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
    'actualWt': actualWeight,
    'lcm': lcm,
    'bcm': bcm,
    'hcm': hcm,
    'volumetricWt': volumetricWeight,
  };
}
