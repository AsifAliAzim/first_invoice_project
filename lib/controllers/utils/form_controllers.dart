import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:signature/signature.dart';

class FormControllers {
  static final billedByOrganizationController = TextEditingController();
  static final billedByEmailController = TextEditingController();
  static final billedByAddressController = TextEditingController();
  static final billedByPhoneController = TextEditingController();
  static final billedToOrganizationController = TextEditingController();
  static final billedToEmailController = TextEditingController();
  static final billedToAddressController = TextEditingController();
  static final billedToPhoneController = TextEditingController();
  static final itemNameController = TextEditingController();
  static final itemQuantityController = TextEditingController();
  static final itemPriceController = TextEditingController();
  static final descriptionController = TextEditingController();
  static final termsAndConditionsController = TextEditingController();
  static final signatureController = SignatureController(penStrokeWidth: 2.sp, penColor: Colors.black);
}
