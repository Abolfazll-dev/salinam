import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:salinam/Utill/dio_provider.dart';
import 'package:salinam/data/Repositories/Authentication_Repository.dart';
import 'package:salinam/data/Repositories/BankRepository.dart';
import 'package:salinam/data/Repositories/BannerRepository.dart';
import 'package:salinam/data/Repositories/CategoryImgRepository.dart';
import 'package:salinam/data/Repositories/DailyPriceRepository.dart';
import 'package:salinam/data/Repositories/NewsRepository.dart';
import 'package:salinam/data/Repositories/Product_Repository.dart';
import 'package:salinam/data/Repositories/travelRepository.dart';
import 'package:salinam/data/dataSource/BankDataSource.dart';
import 'package:salinam/data/dataSource/BannerDataSource.dart';
import 'package:salinam/data/dataSource/CategoryImgDatasource.dart';
import 'package:salinam/data/dataSource/DailyPriceDataSource.dart';
import 'package:salinam/data/dataSource/NewsDataSource.dart';
import 'package:salinam/data/dataSource/Product_DataSource.dart';
import 'package:salinam/data/dataSource/authentication_DataSource.dart';
import 'package:salinam/data/dataSource/travelDataSource.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
      Dio(BaseOptions(baseUrl: 'https://salinam.chbk.run/api/')));

  await _getInitUtils();
  // Authentication DataSource

  _getInitDataSource();

  // Authentication Repository
  _getInitRepositories();
// Bloc _________
}

Future<void> _getInitUtils() async {
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
}

void _getInitDataSource() async {
    locator
      .registerFactory<IAuthenticationDataSource>(() => AuthenticationRemote());
  locator.registerFactory<IBannerDataSource>(() => BannerRemoteDataSource());
  locator
      .registerFactory<ICategoryIMGDataSource>(() => CategoryIMGDatasource());
  locator.registerFactory<IProductDataSource>(() => ProductRemoteDataSource());
  locator.registerFactory<IDailyPriceDataSource>(() => DailyPriceRemoteDataSource());
  locator.registerFactory<ITarvelDataSource>(() => TarvelRemoteDataSource());
  locator.registerFactory<INewsDataSource>(() => NewsRemoteDataSource());
  locator.registerFactory<IBankDataSource>(() => BankRemoteDataSource());



}

void _getInitRepositories() {
    locator.registerFactory<IAuthenticationRepository>(
      () => AuthenticationRepository());
    locator
      .registerFactory<IBannerRepository>(() => BannerRepository());
  locator
      .registerFactory<ICategoryIMGRepository>(() => CategoryIMGRepository());
        locator.registerFactory<IProductRepository>(() => ProductRepository());
        locator.registerFactory<IDailyPriceRepository>(() => DailyPriceRepository());
        locator.registerFactory<ITravelRepository>(() => TravelRepository());
        locator.registerFactory<INewsRepository>(() => NewsRepository());
        locator.registerFactory<IBankRepository>(() => BankRepository());



}
