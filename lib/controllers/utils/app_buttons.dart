
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signature/signature.dart';

import 'app_static_properties.dart';
import 'form_controllers.dart';

class AppButtons {

  static Widget buildClearButton(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.clear,
        color: Colors.red,
      ),
      iconSize: 30.sp,
      onPressed: () => FormControllers.signatureController.clear(),
    );
  }

  static Widget buildCheckButton(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.check,
        color: Colors.lightGreen,
      ),
      iconSize: 30.sp,
      onPressed: () async {
        if (FormControllers.signatureController.isNotEmpty) {
          final exportController = SignatureController(
            penStrokeWidth: 1,
            penColor: Colors.black,
            exportBackgroundColor: Colors.white,
            points: FormControllers.signatureController.points,
          );
          final signature = await exportController.toPngBytes();
          AppStaticProperties.signature = signature!;
          exportController.dispose();
        } else {
          debugPrint('Please sign the invoice');
        }
      },
    );
  }

  static Widget filledButton({required String onTopText}){
    return Container(
      height: 60.sp,
      margin: EdgeInsets.only(
        top: 10.sp,
        left: 20.sp,
        right: 20.sp,
      ),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Center(
        child: Text(
          onTopText,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }

  static Widget alertDialogButton({required String onTopText}){
    return Container(
      height: 40.sp,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Center(
        child: Text(
          onTopText,
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15.sp,
          ),
        ),
      ),
    );
  }

  static Widget pickDateButton(){
    return Container(
      margin: EdgeInsets.only(
        left: 10.sp,
        top: 5.sp,
        bottom: 5.sp,
      ),
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: Center(
        child: Text(
          'Select Date',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
