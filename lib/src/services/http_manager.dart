import 'package:dio/dio.dart';

abstract class HttpMethod {
  static const String post = "POST";
  static const String get = "GET";
  static const String put = "PUT";
  static const String patch = "PATCH";
  static const String delete = "DELETE";
}

class HttpManager {
  Future restRequest({
    required String method,
    required String url,
    Map? headers,
    Map? body,
  }) async {
    //Headers da request
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });

    Dio dio = Dio();

    try {
      Response response = await dio.request(
        url,
        data: body,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
      );

      //Retorno do server
      return response.data;
    } on DioError catch (e) {
      //Retorno  do Dio Request
      return e.response?.data ?? {};
    } catch (e) {
      //Retorno de Map vazio para erros genéricos
      return {};
    }
  }
}
