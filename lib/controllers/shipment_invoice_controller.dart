import 'package:get/get.dart';
import 'package:starlinex_courier/data/arguments/shipment_invoice_args.dart';

class ShipmentInvoiceController extends GetxController {

  var invoiceType = 'Invoice'.obs;
  var incoTerms = 'CFR'.obs;
  var noteText='UNSOLICITED GIFT SENT TO MY FRIENDS & FAMILY MEMBERS FOR THERE PERSONAL USE ONLY'.obs;
  var note = 'GIFT'.obs;
  var args = Rxn();


  void saveArgs() {
    args.value = ShipperArgs(
        invoiceType: invoiceType.value,
        incoTerms: incoTerms.value,
        note: note.value,
        noteText: noteText.value,
    ).toJson();
  }


}
