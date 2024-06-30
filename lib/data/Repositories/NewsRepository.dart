import 'package:dartz/dartz.dart';
import 'package:salinam/data/dataSource/BannerDataSource.dart';
import 'package:salinam/data/dataSource/DailyPriceDataSource.dart';
import 'package:salinam/data/dataSource/NewsDataSource.dart';
import 'package:salinam/data/dataSource/travelDataSource.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/data/moudels/News.dart';
import 'package:salinam/data/moudels/travel.dart';
import 'package:salinam/di/di.dart';

abstract class INewsRepository {
  Future<Either<String, List<News>>> getNewsList();
}

class NewsRepository extends INewsRepository {
  final INewsDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<News>>> getNewsList() async {
    try {
      var response = await _dataSource.getNewsList();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}