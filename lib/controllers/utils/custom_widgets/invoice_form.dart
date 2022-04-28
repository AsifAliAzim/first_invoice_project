import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice/controllers/utils/app_buttons.dart';
import 'package:invoice/controllers/utils/app_nonstatic_properties.dart';
import 'package:invoice/controllers/utils/app_static_properties.dart';
import 'package:invoice/controllers/utils/custom_widgets/add_item_dialog_box.dart';
import 'package:invoice/controllers/utils/custom_widgets/signature_pannel.dart';
import 'package:invoice/controllers/utils/my_pdf_api.dart';

import '../app_nonstatic_methods.dart';
import '../custom_classes/my_pdf_invoice_api.dart';
import '../form_controllers.dart';

class InvoiceForm extends StatefulWidget {
  const InvoiceForm({Key? key}) : super(key: key);

  @override
  State<InvoiceForm> createState() => _InvoiceFormState();
}

class _InvoiceFormState extends State<InvoiceForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(
        bottom: 20.sp,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          height: 40.sp,
          width: 1.sw,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            top: 10.sp,
            left: 25.sp,
          ),
          child: Text(
            'Please Fill The Form Carefully.',
            style: GoogleFonts.montserrat(
              color: Colors.lightGreen,
              fontSize: 14.sp,
              letterSpacing: 1.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Form(
          key: AppStaticProperties.formKey,
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.lightGreen,
              ),
            ),
            child: Stepper(
              type: StepperType.vertical,
              steps: AppNonStaticProperties().getSteps(context),
              onStepTapped: (step) =>
                  setState(() => AppStaticProperties.currentStep = step),
              currentStep: AppStaticProperties.currentStep,
              onStepContinue: () {
                final isLastStep = AppStaticProperties.currentStep ==
                    AppNonStaticProperties().getSteps(context).length - 1;
                if (isLastStep) {
                  if(AppStaticProperties.formKey.currentState!.validate()){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.lightGreen,
                        duration: const Duration(
                          seconds: 3,
                        ),
                        content: Text(
                          'Great! Now add the items',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        duration: const Duration(
                          seconds: 3,
                        ),
                        content: Text(
                          'Please make sure to fill the form properly and don\'t left any field blank',
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                      ),
                    );
                  }
                } else {
                  setState(() {
                    AppStaticProperties.currentStep += 1;
                  });
                }
              },
              onStepCancel: () {
                AppStaticProperties.currentStep == 0
                    ? null
                    : setState(() {
                        AppStaticProperties.currentStep -= 1;
                      });
              },
            ),
          ),
        ),
        InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: (){
              showDialog(
                context: context,
                builder: (context) => const AddItemsAlertDialog(),
              );
            },
            child: AppButtons.filledButton(onTopText: 'Add Items')),
        Container(
          height: 40.sp,
          width: 1.sw,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
            top: 10.sp,
            left: 25.sp,
          ),
          child: Text(
            'Signature',
            style: GoogleFonts.montserrat(
              color: Colors.lightGreen,
              fontSize: 14.sp,
              letterSpacing: 1.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SignaturePanel(),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () async {
            if (!AppStaticProperties.formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent,
                  duration: const Duration(
                    seconds: 3,
                  ),
                  content: Text(
                    'Please make sure to fill the form properly and don\'t left any field blank',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              );
            } else if (AppStaticProperties.signature.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.redAccent,
                  duration: const Duration(
                    seconds: 3,
                  ),
                  content: Text(
                    'Please sign the invoice and make sure to press the check button for confirmation.',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
              );
            } else {
              final myPdfFile = await PdfMyInvoiceApi.generateMyPdfFile(
                  AppNonStaticProperties().myInvoice);
              MyPdfApi.openMyFile(myPdfFile);
            }
          },
          child: AppButtons.filledButton(onTopText: 'Generate Invoice'),
        ),
      ],
    );
  }
}
