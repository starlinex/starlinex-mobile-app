class SpecialServiceArgs {
  String name;
  String pcs;

  SpecialServiceArgs(
      {required this.name,
        required this.pcs,
        });

  Map toJson() => {
    'name': name,
    'pcs': pcs,
  };
}
