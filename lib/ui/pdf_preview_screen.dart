import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:printing/printing.dart';
import 'package:starlinex_courier/network/api/models/booking_history_model.dart';
import 'package:starlinex_courier/ui/pdf_export_screen.dart';

class PdfPreviewPage extends StatelessWidget {
  final BookingHistoryData data;
  const PdfPreviewPage(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(data),
      ),
    );
  }

}
