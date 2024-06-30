import 'package:dartz/dartz.dart';
import 'package:salinam/data/dataSource/BankDataSource.dart';
import 'package:salinam/data/dataSource/BannerDataSource.dart';
import 'package:salinam/data/dataSource/DailyPriceDataSource.dart';
import 'package:salinam/data/dataSource/travelDataSource.dart';
import 'package:salinam/data/moudels/Bank.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/data/moudels/travel.dart';
import 'package:salinam/di/di.dart';

abstract class IBankRepository {
  Future<Either<String, List<Bank>>> getBankList();
}

class BankRepository extends IBankRepository {
  final IBankDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Bank>>> getBankList() async {
    try {
      var response = await _dataSource.getBankList();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}