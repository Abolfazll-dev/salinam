import 'package:salinam/Utill/api_exception.dart';
import 'package:salinam/data/moudels/Bank.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:dio/dio.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/data/moudels/travel.dart';
import 'package:salinam/di/di.dart';

abstract class IBankDataSource {
  Future<List<Bank>> getBankList();
}

class BankRemoteDataSource extends IBankDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<Bank>> getBankList() async {
    try {
      var response = await _dio.get('collections/Bank/records');
      return response.data['items'].reversed
          .map<Bank>((jsonObject) => Bank.fromMapJson(jsonObject))
          .toList();
    } on DioError catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Unknown Error');
    }
  }
}
