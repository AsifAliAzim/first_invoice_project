import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:invoice/controllers/utils/app_nonstatic_properties.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app_buttons.dart';

class AppNonStaticMethods {

  buildButtons(BuildContext context) {
    return Container(
      // color: Colors.black,
      margin: EdgeInsets.only(
        top: 5.sp,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: AppButtons.buildCheckButton(context),
          ),
          Expanded(
            child: AppButtons.buildClearButton(context),
          ),
        ],
      ),
    );
  }

  Future storeSignature(BuildContext context, Uint8List? signature) async {
    final status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    final time = DateTime.now().toIso8601String().replaceAll('.', ':');
    final name = 'signature_$time.png';

    final result = await ImageGallerySaver.saveImage(signature!, name: name);
    final isSuccess = result['isSuccess'];

    if (isSuccess) {
      Navigator.pop(context);

      Scaffold.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.lightGreen,
          content: Text('Saved to signature folder'),
        ),
      );
    } else {
      Scaffold.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Failed! To Save Signature'),
        ),
      );
    }
  }

  incrementItemSerialNumber(){
    return  AppNonStaticProperties().itemSerialNumber++;
  }
}
