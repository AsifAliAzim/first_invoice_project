import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/utils/custom_widgets/invoice_form.dart';

class InvoiceFormScreen extends StatelessWidget {
  const InvoiceFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.green.shade100,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          centerTitle: true,
          title: Text(
            'Invoice Generator',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: const InvoiceForm(),
      ),
    );
  }
}
