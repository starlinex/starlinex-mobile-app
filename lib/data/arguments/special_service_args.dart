class SpecialServiceArgs {
  String name;
  String pcs;

  SpecialServiceArgs(
      {required this.name,
        required this.pcs,
        });

  Map toJson() => {
    'specialServiceName': name,
    'specialServicePcs': pcs,
  };
}
