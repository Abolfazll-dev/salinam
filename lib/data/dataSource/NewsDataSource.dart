import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:dio/dio.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/data/moudels/News.dart';
import 'package:salinam/data/moudels/travel.dart';
import 'package:salinam/di/di.dart';

abstract class INewsDataSource {
  Future<List<News>> getNewsList();
}

class NewsRemoteDataSource extends INewsDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<News>> getNewsList() async {
    try {
      var response = await _dio.get('collections/News/records');
      return response.data['items'].reversed
          .map<News>((jsonObject) => News.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}
