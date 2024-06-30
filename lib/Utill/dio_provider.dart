import 'package:dio/dio.dart';
import 'package:salinam/Utill/Auth_manager.dart';


class DioProvider {
  static Dio createDio() {
    Dio dio = Dio(BaseOptions(baseUrl: 'https://salinam.chbk.run/api/', headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AuthManager.readAuth()}'
    }));

    return dio;
  }

  static Dio createDioWithoutHeader() {
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://salinam.chbk.run/api/',
    ));

    return dio;
  }
}
