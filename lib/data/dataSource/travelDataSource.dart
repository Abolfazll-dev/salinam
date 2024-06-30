import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:dio/dio.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/data/moudels/travel.dart';
import 'package:salinam/di/di.dart';

abstract class ITarvelDataSource {
  Future<List<Travel>> getTravelList();
}

class TarvelRemoteDataSource extends ITarvelDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Travel>> getTravelList() async {
    try {
      var response = await _dio.get('collections/travel/records');
      return response.data['items']
          .map<Travel>((jsonObject) => Travel.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}
