import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:invoice/controllers/utils/app_buttons.dart';
import 'package:invoice/controllers/utils/form_controllers.dart';

import '../../models/billed_by_model.dart';
import '../../models/billed_to_model.dart';
import '../../models/data_model.dart';
import '../../models/item_model.dart';
import '../../models/total_summery_model.dart';
import 'app_static_properties.dart';

class AppNonStaticProperties {
  List<Step> getSteps(BuildContext context) {
    return [
      Step(
        state: AppStaticProperties.currentStep > 0
            ? StepState.complete
            : StepState.indexed,
        isActive: AppStaticProperties.currentStep >= 0,
        title: Text(
          'Dates',
          style: GoogleFonts.montserrat(
            color: Colors.lightGreen,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
        content: Container(
          height: 100.sp,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Invoice Date:',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          DateTime? invoiceDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2023),
                          );
                        },
                        child: AppButtons.pickDateButton(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Due Date:',
                        style: GoogleFonts.montserrat(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          DateTime? invoiceDueDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2023),
                          );
                        },
                        child: AppButtons.pickDateButton(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Step(
        state: AppStaticProperties.currentStep > 1
            ? StepState.complete
            : StepState.indexed,
        isActive: AppStaticProperties.currentStep >= 1,
        title: Text(
          'Billed By',
          style: GoogleFonts.montserrat(
            color: Colors.lightGreen,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
        content: Container(
          height: 200.sp,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter organization name.';
                    }
                    return null;
                  },
                  controller: FormControllers.billedByOrganizationController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Organization',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email.';
                    }
                    return null;
                  },
                  controller: FormControllers.billedByEmailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an address.';
                    }
                    return null;
                  },
                  controller: FormControllers.billedByAddressController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 11 ||
                        value.length > 11) {
                      return 'Please enter a proper phone number';
                    }
                    return null;
                  },
                  controller: FormControllers.billedByPhoneController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Step(
        state: AppStaticProperties.currentStep > 2
            ? StepState.complete
            : StepState.indexed,
        isActive: AppStaticProperties.currentStep >= 2,
        title: Text(
          'Billed To',
          style: GoogleFonts.montserrat(
            color: Colors.lightGreen,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
        content: Container(
          height: 200.sp,
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter organization name.';
                    }
                    return null;
                  },
                  controller: FormControllers.billedToOrganizationController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: 'Organization',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an email.';
                    }
                    return null;
                  },
                  controller: FormControllers.billedToEmailController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },
                  controller: FormControllers.billedToAddressController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.streetAddress,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 11 ||
                        value.length > 11) {
                      return 'Please enter a proper phone number';
                    }
                    return null;
                  },
                  controller: FormControllers.billedToPhoneController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone',
                    hintStyle: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Step(
        state: AppStaticProperties.currentStep > 3
            ? StepState.complete
            : StepState.indexed,
        isActive: AppStaticProperties.currentStep >= 3,
        title: Text(
          'Description',
          style: GoogleFonts.montserrat(
            color: Colors.lightGreen,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
        content: Container(
          height: 200.sp,
          color: Colors.white,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter proper description.';
              }
              return null;
            },
            controller: FormControllers.descriptionController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Description',
              hintStyle: GoogleFonts.montserrat(
                color: Colors.grey,
                fontSize: 10.sp,
              ),
            ),
            maxLines: 10,
          ),
        ),
      ),
      Step(
        state: AppStaticProperties.currentStep > 4
            ? StepState.complete
            : StepState.indexed,
        isActive: AppStaticProperties.currentStep >= 4,
        title: Text(
          'Terms And Conditions',
          style: GoogleFonts.montserrat(
            color: Colors.lightGreen,
            fontWeight: FontWeight.w400,
            fontSize: 18.sp,
          ),
        ),
        content: Container(
          height: 200.sp,
          color: Colors.white,
          child: TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter terms and conditions.';
              }
              return null;
            },
            controller: FormControllers.termsAndConditionsController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Terms & Conditions',
              hintStyle: GoogleFonts.montserrat(
                color: Colors.grey,
                fontSize: 10.sp,
              ),
            ),
            maxLines: 10,
          ),
        ),
      ),
    ];
  }

  int itemSerialNumber = 0;

  final myInvoice = InvoiceModel(
    id: '0001',
    invoiceDate: DateTime.now(),
    dueDate: DateTime.now(),
    billedBy: BilledByModel(
      organization: FormControllers.billedByOrganizationController.text.trim(),
      email: FormControllers.billedByEmailController.text.trim(),
      address: FormControllers.billedByAddressController.text.trim(),
      phoneNumber: FormControllers.billedToPhoneController.text.trim(),
    ),
    billedTo: BilledToModel(
      billedOrganization:
          FormControllers.billedToOrganizationController.text.trim(),
      billedEmail: FormControllers.billedToEmailController.text.trim(),
      billedAddress: FormControllers.billedToAddressController.text.trim(),
      billedPhoneNumber: FormControllers.billedToPhoneController.text.trim(),
    ),
    item: [
      ItemModel(
        serialNumber: 0,
        itemName: '',
        quantity: 0,
        price: 0,
      ),
      ItemModel(
        serialNumber: 0,
        itemName: '',
        quantity: 0,
        price: 0,
      ),
      ItemModel(
        serialNumber: 0,
        itemName: '',
        quantity: 0,
        price: 0,
      ),
    ],
    description: FormControllers.descriptionController.text.trim(),
    termsAndConditions:
        FormControllers.termsAndConditionsController.text.trim(),
    totalSummeryModel: TotalSummeryModel(
      totalExTax: '${15}%',
      discount: '${15}%',
      tax: '${15}%',
      subTotalIncTax: '${5000} Pkr',
    ),
  );
}
