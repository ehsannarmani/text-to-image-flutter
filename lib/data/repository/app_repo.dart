import 'dart:typed_data';

import 'package:asmr_text_to_image_ai/data/data_source/api.dart';

class AppRepo{
  final Api _api;
  AppRepo(this._api);

  Future<Uint8List?> generateImage(String prompt) async{
    var result = await _api.generateImage(prompt);
    return result.statusCode == 200 ? result.data : null;
  }
}