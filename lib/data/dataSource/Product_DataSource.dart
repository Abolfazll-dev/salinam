
import 'package:dio/dio.dart';
import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/data/moudels/product.dart';
import 'package:salinam/di/di.dart';

abstract class IProductDataSource {
  Future<List<Product>> GetProducts();
  Future<List<Product>> getBestSeller();
  Future<List<Product>> getHotest();
  Future<List<Product>> getHazine();
}

class ProductRemoteDataSource extends IProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Product>> GetProducts() async {
    try {
      var response = await _dio.get('collections/Products/records');
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }

  @override
  Future<List<Product>> getBestSeller() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="tarh"'};
      var response = await _dio.get('collections/Products/records',
          queryParameters: qParams);
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }

  @override
  Future<List<Product>> getHotest() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="plan"'};
      var response = await _dio.get('collections/Products/records',
          queryParameters: qParams);
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
    @override
  Future<List<Product>> getHazine() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="hazine"'};
      var response = await _dio.get('collections/Products/records',
          queryParameters: qParams);
      return response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}
