import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:dio/dio.dart';
import 'package:salinam/data/moudels/Category_Images.dart';
import 'package:salinam/di/di.dart';

abstract class ICategoryIMGDataSource {
  Future<List<CategoryIMG>> GetCategoryImg();
  Future<List<CategoryIMG>> GetCategoryScreenImg();
}

class CategoryIMGDatasource extends ICategoryIMGDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<CategoryIMG>> GetCategoryImg() async {
    try {
      var response = await _dio.get('collections/CategoryImages/records');
      return response.data['items']
          .map<CategoryIMG>((jsonObject) => CategoryIMG.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
  
  @override
  Future<List<CategoryIMG>> GetCategoryScreenImg() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="screen"'};
      var response = await _dio.get('collections/CategoryImages/records',
          queryParameters: qParams);
      return response.data['items']
          .map<CategoryIMG>((jsonObject) => CategoryIMG.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}
