
import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:dio/dio.dart';
import 'package:salinam/di/di.dart';

abstract class IBannerDataSource {
  Future<List<BannerCampain>> GetBanners();
}

class BannerRemoteDataSource extends IBannerDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerCampain>> GetBanners() async {
    try {
      var response = await _dio.get('collections/SliderBanners/records');
      return response.data['items']
          .map<BannerCampain>(
              (jsonObject) => BannerCampain.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}
