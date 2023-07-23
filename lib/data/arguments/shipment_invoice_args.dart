class ShipperArgs {

  String invoiceType;
  String incoTerms;
  String note;
  String noteText;

  ShipperArgs(
      {required this.invoiceType,
        required this.incoTerms,
        required this.note,
        required this.noteText,
      });

  Map toJson() => {
    'invoice_type': invoiceType,
    'inco_terms': incoTerms,
    'note': note,
    'note_text': noteText,
  };
}
