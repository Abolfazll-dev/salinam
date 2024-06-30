import 'package:dartz/dartz.dart';
import 'package:salinam/data/dataSource/BannerDataSource.dart';
import 'package:salinam/data/dataSource/DailyPriceDataSource.dart';
import 'package:salinam/data/dataSource/travelDataSource.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/data/moudels/travel.dart';
import 'package:salinam/di/di.dart';

abstract class ITravelRepository {
  Future<Either<String, List<Travel>>> getTravelList();
}

class TravelRepository extends ITravelRepository {
  final ITarvelDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Travel>>> getTravelList() async {
    try {
      var response = await _dataSource.getTravelList();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}