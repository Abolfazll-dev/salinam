import 'package:dartz/dartz.dart';
import 'package:salinam/data/dataSource/BannerDataSource.dart';
import 'package:salinam/data/dataSource/CategoryImgDatasource.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:salinam/data/moudels/Category_Images.dart';
import 'package:salinam/di/di.dart';

abstract class ICategoryIMGRepository {
  Future<Either<String, List<CategoryIMG>>> GetCategoryImg();
  Future<Either<String, List<CategoryIMG>>> GetCategoryScreenImg();
}

class CategoryIMGRepository extends ICategoryIMGRepository {
  final ICategoryIMGDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<CategoryIMG>>> GetCategoryImg() async {
    try {
      var response = await _dataSource.GetCategoryImg();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
    Future<Either<String, List<CategoryIMG>>> GetCategoryScreenImg() async {
    try {
      var response = await _dataSource.GetCategoryScreenImg();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}