import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoice/controllers/utils/app_nonstatic_methods.dart';
import 'package:invoice/controllers/utils/form_controllers.dart';
import 'package:signature/signature.dart';

class SignaturePanel extends StatefulWidget {
  const SignaturePanel({Key? key}) : super(key: key);

  @override
  State<SignaturePanel> createState() => _SignaturePanelState();
}

class _SignaturePanelState extends State<SignaturePanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.sp,
      margin: EdgeInsets.only(
        left: 20.sp,
        right: 20.sp,
        bottom: 20.sp,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.sp),
              child: Signature(
                controller: FormControllers.signatureController,
                backgroundColor: Colors.yellow.withOpacity(0.2),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: AppNonStaticMethods().buildButtons(context),
          ),
        ],
      ),
    );
  }
}
