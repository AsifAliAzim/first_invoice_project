import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

import 'form_controllers.dart';

class AppStaticMethods {

  static Future<Uint8List?> exportingSignature() async {
    final exportController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
      points: FormControllers.signatureController.points,
    );

    final signature = await exportController.toPngBytes();

    exportController.dispose();

    return signature;
  }

}
