import 'package:dio/dio.dart';

class Api{
  Dio _dio;
  String apiKey = "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";

  Api(this._dio);

  dynamic generateImage(String prompt) async{
    var response = await _dio.post(
      "https://api-inference.huggingface.co/models/prompthero/openjourney",
      options: Options(
        headers: {
          "Authorization": "Bearer $apiKey"
        },
        responseType: ResponseType.bytes,
        followRedirects: false
      ),
      data: prompt
    );
    return response;
  }
}