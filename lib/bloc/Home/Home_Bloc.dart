import 'package:bloc/bloc.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/bloc/Home/Home_State.dart';
import 'package:salinam/data/Repositories/BankRepository.dart';
import 'package:salinam/data/Repositories/BannerRepository.dart';
import 'package:salinam/data/Repositories/CategoryImgRepository.dart';
import 'package:salinam/data/Repositories/DailyPriceRepository.dart';
import 'package:salinam/data/Repositories/NewsRepository.dart';
import 'package:salinam/data/Repositories/Product_Repository.dart';
import 'package:salinam/data/Repositories/travelRepository.dart';
import 'package:salinam/data/dataSource/DailyPriceDataSource.dart';
import 'package:salinam/di/di.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IBannerRepository _bannerRepository = locator.get();
  final ICategoryIMGRepository _categoryRepository = locator.get();
  final IProductRepository _productRepository = locator.get();
  final IDailyPriceRepository _dailyPriceRepository = locator.get();
  final ITravelRepository _travelRepository = locator.get();
  final INewsRepository _newsRepository = locator.get();
  final IBankRepository _bankRepository = locator.get();
  HomeBloc() : super(HomeInitState()) {
    on<HomeGetInitData>((event, emit) async {
      emit(HomeLoadingState());

      var bannerList = await _bannerRepository.GetBanners();
      var categoryList = await _categoryRepository.GetCategoryImg();
      var productList = await _productRepository.getBestSeller();
      var planList = await _productRepository.getHotest();
      var hazineList = await _productRepository.getHazine();
      var category = await _categoryRepository.GetCategoryScreenImg();
      var dailyPrice = await _dailyPriceRepository.GetDailyPrice();
      var travel = await _travelRepository.getTravelList();
      var news = await _newsRepository.getNewsList();
      var bank = await _bankRepository.getBankList();

      emit(HomeRequestSuccessState(bannerList, categoryList, productList,
          planList, hazineList, category, dailyPrice,travel,news,bank));
    });
  }
}
