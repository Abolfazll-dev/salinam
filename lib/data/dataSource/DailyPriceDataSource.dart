import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:dio/dio.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/di/di.dart';

abstract class IDailyPriceDataSource {
  Future<List<DailyPrice2>> GetDailyPrice();
}

class DailyPriceRemoteDataSource extends IDailyPriceDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<DailyPrice2>> GetDailyPrice() async {
    try {
      var response = await _dio.get('collections/Price/records');
      return response.data['items']
          .map<DailyPrice2>((jsonObject) => DailyPrice2.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}
