import 'dart:typed_data';

import 'package:invoice/controllers/utils/app_nonstatic_properties.dart';
import 'package:invoice/models/data_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';

import '../app_static_properties.dart';

class MyInvoiceMethods {

  static Widget topBanner() {
    return pw.Padding(
      padding: const pw.EdgeInsets.only(
        right: 55,
        bottom: 10,
      ),
      child: pw.Container(
        height: 30,
        color: PdfColors.lightGreen,
      ),
    );
  }

  static Widget buildHeader(InvoiceModel myInvoice, Uint8List logo) {
    return pw.Container(
      height: 120,
      // color: PdfColors.grey,
      padding: const pw.EdgeInsets.only(
        left: 30,
        right: 30,
      ),
      child: pw.Row(children: [
        pw.Expanded(
          flex: 1,
          child: pw.SizedBox(
            height: 80,
            width: 80,
            child: pw.Image(
              pw.MemoryImage(
                logo,
              ),
            ),
          ),
        ),
        pw.Expanded(
          flex: 4,
          child: pw.ListView(padding: pw.EdgeInsets.zero, children: [
            pw.Center(
              child: pw.Text(
                'Invoice',
                style: pw.TextStyle(
                  fontSize: 19,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
            ),
            pw.SizedBox(
              height: 5,
            ),
            pw.Center(
              child: pw.Text(
                'Invoice ID#  ${myInvoice.id}',
                style: pw.TextStyle(
                  fontSize: 17,
                  fontWeight: pw.FontWeight.normal,
                ),
              ),
            ),
            pw.SizedBox(
              height: 5,
            ),
            pw.Container(
                height: 50,
                child: pw.Row(children: [
                  pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        height: 50,
                        child: pw.Column(children: [
                          pw.Expanded(
                              flex: 1,
                              child: pw.Center(
                                  child: pw.Text(
                                    'Invoice Date',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.normal,
                                      color: PdfColors.grey500,
                                    ),
                                  ))),
                          pw.Expanded(
                              flex: 1,
                              child: pw.Center(
                                  child: pw.Text(
                                    AppStaticProperties.formattedInvoiceDate,
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.normal,
                                      color: PdfColors.black,
                                    ),
                                  ))),
                        ]),
                      )),
                  pw.Expanded(
                      flex: 1,
                      child: pw.Container(
                        height: 50,
                        child: pw.Column(children: [
                          pw.Expanded(
                              flex: 1,
                              child: pw.Center(
                                  child: pw.Text(
                                    'Due Date',
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.normal,
                                      color: PdfColors.grey500,
                                    ),
                                  ))),
                          pw.Expanded(
                              flex: 1,
                              child: pw.Center(
                                  child: pw.Text(
                                    AppStaticProperties.formattedInvoiceDueDate,
                                    style: pw.TextStyle(
                                      fontSize: 12,
                                      fontWeight: pw.FontWeight.normal,
                                      color: PdfColors.black,
                                    ),
                                  ))),
                        ]),
                      )),
                ])),
          ]),
        ),
        pw.Expanded(
          flex: 1,
          child: pw.SizedBox(
            height: 70,
            width: 70,
            child: BarcodeWidget(
              barcode: Barcode.qrCode(),
              data: myInvoice.id,
            ),
          ),
        ),
      ]),
    );
  }

  static Widget billDetails(InvoiceModel myInvoice) {
    return pw.Container(
        height: 180,
        child: pw.Row(children: [
          pw.Expanded(
            flex: 3,
            child: billedBy(myInvoice),
          ),
          pw.Expanded(
            flex: 2,
            child: billedTo(myInvoice),
          ),
        ]));
  }

  static Widget billedBy(InvoiceModel myInvoice) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 30,
      ),
      child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text('Billed By',
                    style: const pw.TextStyle(
                      color: PdfColors.lightGreen,
                      fontSize: 14,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text(
                  myInvoice.billedBy.organization,
                    style: const pw.TextStyle(
                      color: PdfColors.grey800,
                      fontSize: 12,
                    ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text(
                    myInvoice.billedBy.email,
                    style: const pw.TextStyle(
                      color: PdfColors.grey800,
                      fontSize: 12,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text(
                    myInvoice.billedBy.address,
                    style: const pw.TextStyle(
                      color: PdfColors.grey800,
                      fontSize: 12,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text(
                    myInvoice.billedBy.phoneNumber,
                    style: const pw.TextStyle(
                      color: PdfColors.grey800,
                      fontSize: 12,
                    )),
              ),
            ),
          ]),
    );
  }

  static Widget billedTo(InvoiceModel myInvoice) {
    return pw.Container(
      padding: const pw.EdgeInsets.only(
        top: 10,
        bottom: 10,
        left: 2,
        right: 5,
      ),
      child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.start,
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.purple,
                child: pw.Text('Billed To',
                    style: const pw.TextStyle(
                      color: PdfColors.lightGreen,
                      fontSize: 14,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text(
                    myInvoice.billedTo.billedOrganization,
                    style: const pw.TextStyle(
                      color: PdfColors.grey800,
                      fontSize: 12,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text(myInvoice.billedTo.billedEmail,
                    style: const pw.TextStyle(
                      color: PdfColors.grey800,
                      fontSize: 12,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text(myInvoice.billedTo.billedAddress,
                    style: const pw.TextStyle(
                      color: PdfColors.grey800,
                      fontSize: 12,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: pw.Container(
                height: 20,
                // color: PdfColors.pink,
                child: pw.Text(myInvoice.billedTo.billedPhoneNumber,
                    style: const pw.TextStyle(
                      color: PdfColors.grey800,
                      fontSize: 12,
                    )),
              ),
            ),
          ]),
    );
  }

  static Widget invoiceTable(InvoiceModel myInvoice) {
    final header = [
      'S.No',
      'Item name',
      'Quantity',
      'Item Price',
      'Total Price',
    ];
    final data = AppStaticProperties.listOfItems.map((item) {
      return [
        item.serialNumber,
        item.itemName,
        item.quantity,
        '${item.price} Pkr',
        '${item.price * item.quantity} Pkr',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: header,
      data: data,
      border: null,
      headerStyle: TextStyle(
        fontWeight: pw.FontWeight.normal,
        color: PdfColors.white,
      ),
      headerDecoration: const BoxDecoration(
        color: PdfColors.lightGreen,
      ),
      cellPadding: const pw.EdgeInsets.only(
        left: 35,
        right: 35,
      ),
      cellHeight: 35,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerLeft,
        2: Alignment.center,
        3: Alignment.center,
        4: Alignment.center,
        5: Alignment.center,
      },
    );
  }

  static Widget descriptionTermsAndConditions(InvoiceModel myInvoice) {
    return pw.Container(
      height: 200,
      child: pw.Row(
        children: [
          pw.Expanded(
            flex: 4,
            child: pw.Container(
              padding: const pw.EdgeInsets.only(
                top: 20,
                bottom: 10,
                left: 30,
              ),
              child: pw.Column(
                mainAxisAlignment: pw.MainAxisAlignment.end,
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Container(
                      child: pw.Text('Description',
                          style: const pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 14,
                          )),
                    ),
                  ),
                  pw.Expanded(
                    flex: 5,
                    child: pw.Container(
                      child: pw.Text(
                          myInvoice.description,
                          style: const pw.TextStyle(
                            color: PdfColors.grey700,
                            fontSize: 11,
                            height: 2.5,
                            letterSpacing: 1,
                          )),
                    ),
                  ),
                  pw.Expanded(
                    flex: 2,
                    child: pw.Container(
                      child: pw.Text('Terms and Conditions',
                          style: const pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 14,
                          )),
                    ),
                  ),
                  pw.Expanded(
                    flex: 6,
                    child: pw.Container(
                      child: pw.Text(
                        myInvoice.termsAndConditions,
                          style: const pw.TextStyle(
                            color: PdfColors.grey700,
                            fontSize: 11,
                            height: 2.5,
                            letterSpacing: 1,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          pw.Expanded(
            flex: 3,
            child: totalSummaryTable(myInvoice),
          ),
        ],
      ),
    );
  }

  static Widget totalSummaryTable(InvoiceModel myInvoice){
    return pw.Padding(
      padding: const pw.EdgeInsets.only(right: 40,),
      child: Container(
        height: 150,
        color: PdfColors.yellow50,
        child: pw.Column(
          children: [
            pw.Expanded(
              flex: 3,
              child: pw.Container(
                width: 220,
                color: PdfColors.lightGreen,
                alignment: pw.Alignment.centerLeft,
                child: pw.Text(
                    '  Total Summary',
                    textAlign: pw.TextAlign.left,
                    style: const pw.TextStyle(
                      color: PdfColors.white,
                      fontSize: 13,
                    )
                ),
              ),
            ),
            pw.Expanded(
              flex: 4,
              child: pw.Container(
                // height: 40,
                color: PdfColors.yellow50,
                child: pw.Row(
                  children: [
                  pw.Expanded(
                    flex: 2,
                    child: pw.Text(
                      '  Total (Exc TAX)',
                      textAlign: pw.TextAlign.left,
                      style: const pw.TextStyle(
                        color: PdfColors.grey800,
                        fontSize: 11,
                      ),
                    )
                  ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          '${myInvoice.totalSummeryModel.totalExTax} Pkr  ',
                          textAlign: pw.TextAlign.right,
                          style: const pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 12,
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
            pw.Expanded(
              flex: 4,
              child: pw.Container(
                // height: 40,
                color: PdfColors.yellow50,
                child: pw.Row(
                  children: [
                    pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          '  Discount',
                          textAlign: pw.TextAlign.left,
                          style: const pw.TextStyle(
                            color: PdfColors.grey800,
                            fontSize: 11,
                          ),
                        )
                    ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          '${myInvoice.totalSummeryModel.discount} Pkr  ',
                          textAlign: pw.TextAlign.right,
                          style: const pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 12,
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
            pw.Expanded(
              flex: 4,
              child: pw.Container(
                // height: 40,
                color: PdfColors.yellow50,
                child: pw.Row(
                  children: [
                    pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          '  Tax',
                          textAlign: pw.TextAlign.left,
                          style: const pw.TextStyle(
                            color: PdfColors.grey800,
                            fontSize: 11,
                          ),
                        )
                    ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          '${myInvoice.totalSummeryModel.tax} Pkr  ',
                          textAlign: pw.TextAlign.right,
                          style: const pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 12,
                          ),
                        )
                    ),
                  ],
                ),
              ),
            ),
            pw.Expanded(
              flex: 4,
              child: pw.Container(
                // height: 40,
                color: PdfColors.yellow50,
                child: pw.Row(
                  children: [
                    pw.Expanded(
                        flex: 2,
                        child: pw.Text(
                          '  Sub Total (Inc TAX)',
                          textAlign: pw.TextAlign.left,
                          style: const pw.TextStyle(
                            color: PdfColors.grey800,
                            fontSize: 11,
                          ),
                        )
                    ),
                    pw.Expanded(
                        flex: 1,
                        child: pw.Text(
                          '${myInvoice.totalSummeryModel.subTotalIncTax} Pkr  ',
                          textAlign: pw.TextAlign.right,
                          style: const pw.TextStyle(
                            color: PdfColors.black,
                            fontSize: 12,
                          ),
                        ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  static Widget signature(){
    return pw.Padding(
      padding: const pw.EdgeInsets.only(
        left: 30,
      ),
      child: pw.Container(
        height: 100,
        width: 100,
        alignment: pw.Alignment.center,
        child: pw.Image(
          pw.MemoryImage(AppStaticProperties.signature),
        ),
      ),
    );
}

  static Widget footer() {
    return pw.Container(
      height: 30,
      color: PdfColors.lightGreen,
    );
  }
}