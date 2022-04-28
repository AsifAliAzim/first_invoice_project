import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:invoice/controllers/utils/app_static_properties.dart';
import 'package:invoice/controllers/utils/custom_classes/my_invoice_methods.dart';
import 'package:pdf/pdf.dart';
import 'package:invoice/controllers/utils/my_pdf_api.dart';
import 'package:invoice/models/data_model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

class PdfMyInvoiceApi {
  static Future<File> generateMyPdfFile(InvoiceModel myInvoice) async {
    var logo = (await rootBundle.load("assets/images/logo.jpeg")).buffer.asUint8List();
    // final signature = AppStaticProperties.signature;
    AppStaticProperties.pdf.addPage(MultiPage(
      margin: pw.EdgeInsets.zero,
      pageFormat: PdfPageFormat.a4,
      header: (context) => MyInvoiceMethods.topBanner(),
      build: (pw.Context context) => [
        MyInvoiceMethods.buildHeader(myInvoice, logo),
        MyInvoiceMethods.billDetails(myInvoice),
        MyInvoiceMethods.invoiceTable(myInvoice),
        MyInvoiceMethods.descriptionTermsAndConditions(myInvoice),
        MyInvoiceMethods.signature(),
      ],
      footer: (context) => MyInvoiceMethods.footer(),
    ));
    return MyPdfApi.saveMyDocument(name: 'my_generated_invoice.pdf');
  }
}
