import 'package:dartz/dartz.dart';
import 'package:salinam/data/dataSource/BannerDataSource.dart';
import 'package:salinam/data/dataSource/DailyPriceDataSource.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/di/di.dart';

abstract class IDailyPriceRepository {
  Future<Either<String, List<DailyPrice2>>> GetDailyPrice();
}

class DailyPriceRepository extends IDailyPriceRepository {
  final IDailyPriceDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<DailyPrice2>>> GetDailyPrice() async {
    try {
      var response = await _dataSource.GetDailyPrice();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}
