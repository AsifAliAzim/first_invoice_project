import 'package:invoice/models/item_model.dart';
import 'package:invoice/models/total_summery_model.dart';

import 'billed_by_model.dart';
import 'billed_to_model.dart';

class InvoiceModel {
  final String id;
  final DateTime invoiceDate;
  final DateTime dueDate;
  final BilledByModel billedBy;
  final BilledToModel billedTo;
  final List<ItemModel> item;
  final String description;
  final String termsAndConditions;
  final TotalSummeryModel totalSummeryModel;

  InvoiceModel(
  {
    required this.id,
    required this.invoiceDate,
    required this.dueDate,
    required this.billedBy,
    required this.billedTo,
    required this.item,
    required this.description,
    required this.termsAndConditions,
    required this.totalSummeryModel,
}
  );
}
