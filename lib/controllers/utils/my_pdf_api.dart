import 'dart:io';

import 'package:invoice/controllers/utils/app_static_properties.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';

class MyPdfApi {

  static Future<File> saveMyDocument({
    required String name,
  }) async {
    final bytes = await AppStaticProperties.pdf.save();
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$name');
    await file.writeAsBytes(bytes);
    return file;
  }

  static Future openMyFile(File file) async {
    final url = file.path;
    await OpenFile.open(url);
  }
}
