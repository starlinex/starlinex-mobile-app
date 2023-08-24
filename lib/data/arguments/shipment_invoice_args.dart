class ShipperArgs {

  late String invoiceType;
  late String incoTerms;
  late String note;
  late String noteText;

  ShipperArgs(
      {required this.invoiceType,
        required this.incoTerms,
        required this.note,
        required this.noteText,
      });

  ShipperArgs.fromJson(Map<String, dynamic> json)
      :
        invoiceType = json['invoice_type'],
        incoTerms = json['inco_terms'],
        note = json['note'],
        noteText = json['note_text'];

  Map<String,dynamic> toJson() => {
    'invoice_type': invoiceType,
    'inco_terms': incoTerms,
    'note': note,
    'note_text': noteText,
  };
}
