import 'package:dartz/dartz.dart';
import 'package:salinam/data/moudels/Bank.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:salinam/data/moudels/Category_Images.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';
import 'package:salinam/data/moudels/News.dart';
import 'package:salinam/data/moudels/product.dart';
import 'package:salinam/data/moudels/travel.dart';

abstract class HomeState {}

class HomeLoadingState extends HomeState {}

class HomeInitState extends HomeState {}

class HomeRequestSuccessState extends HomeState {
  Either<String, List<BannerCampain>> bannerList;
  Either<String, List<CategoryIMG>> categoryList;
  Either<String, List<Product>> productList;
  Either<String, List<Product>> planList;
  Either<String, List<Product>> hazineList;
  Either<String, List<CategoryIMG>> category;
  Either<String, List<DailyPrice2>> dailyPrice;
  Either<String, List<Travel>> travel;
  Either<String, List<News>> news;
  Either<String, List<Bank>> bank;

  HomeRequestSuccessState(
    this.bannerList,
    this.categoryList,
    this.productList,
    this.planList,
    this.hazineList,
    this.category,
    this.dailyPrice,
    this.travel,
    this.news,
    this.bank

  );
}
