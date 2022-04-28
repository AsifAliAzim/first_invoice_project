import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:invoice/models/item_model.dart';
import 'package:pdf/widgets.dart';

class AppStaticProperties {
  static int currentStep = 0;

  static int itemSerialNumber = 1;

  static DateTime invoiceDate =  DateTime.now();

  static DateTime invoiceDueDate = DateTime.now();

  static Uint8List signature = Uint8List(0);

  static final formKey = GlobalKey<FormState>();

  static final date = DateTime.now();

  static final dueDate = date.add(const Duration(days: 7));

  static final DateFormat format = DateFormat('MM,dd,yyyy');

  static final String formattedInvoiceDate = format.format(invoiceDate);

  static final String formattedInvoiceDueDate  = format.format(invoiceDueDate);

  static final pdf = Document();

  static List<ItemModel> listOfItems = [];
}
