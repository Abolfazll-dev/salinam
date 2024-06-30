
import 'package:dartz/dartz.dart';
import 'package:salinam/data/dataSource/Product_DataSource.dart';
import 'package:salinam/data/moudels/product.dart';
import 'package:salinam/di/di.dart';

abstract class IProductRepository {
  Future<Either<String, List<Product>>> getProducts();
  Future<Either<String, List<Product>>> getHotest();
  Future<Either<String, List<Product>>> getBestSeller();
  Future<Either<String, List<Product>>> getHazine();
}

class ProductRepository extends IProductRepository {
  final IProductDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try {
      var response = await _dataSource.GetProducts();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
  
  @override
  Future<Either<String, List<Product>>> getBestSeller() async{
    try {
      var response = await _dataSource.getBestSeller();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
  
  @override
  Future<Either<String, List<Product>>> getHotest()async {
    try {
      var response = await _dataSource.getHotest();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
    @override
  Future<Either<String, List<Product>>> getHazine()async {
    try {
      var response = await _dataSource.getHazine();
      return right(response);
    } catch (ex) {
      return left('خطا محتوای متنی ندارد');
    }
  }
}
