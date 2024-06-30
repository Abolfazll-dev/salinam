import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:salinam/Screens/Links/BankScreen.dart';
import 'package:salinam/Screens/Links/CalculateScreen.dart';
import 'package:salinam/Screens/Links/DailyPrice.dart';
import 'package:salinam/Screens/Links/Hazine.dart';
import 'package:salinam/Screens/Links/HazineMainScreen.dart';
import 'package:salinam/Screens/Links/NemooneNagshePlan.dart';
import 'package:salinam/Screens/Links/NemooneTarh.dart';
import 'package:salinam/Screens/Links/TravelScreen.dart';
import 'package:salinam/Screens/Links/vamScreen.dart';
import 'package:salinam/Screens/LoginScreen.dart';
import 'package:salinam/Widget/Category.dart';
import 'package:salinam/Widget/TarhTojihiItem.dart';
import 'package:salinam/Widget/productItem.dart';
import 'package:salinam/Widget/slider_banner.dart';
import 'package:salinam/bloc/Home/Home_Bloc.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/bloc/Home/Home_State.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/data/moudels/Category_Images.dart';
import 'package:salinam/data/moudels/product.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.8);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 248, 248),
      body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (state is HomeRequestSuccessState) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: RefreshIndicator(
                onRefresh: () async {
                  BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
                },
                child: CustomScrollView(
                  slivers: [
                    ...[
                      state.bannerList.fold((l) {
                        return const SliverToBoxAdapter(
                          child: Text('خطا'),
                        );
                      }, (r) {
                        return SliverToBoxAdapter(
                          child: SlideBanner(r),
                        );
                      })
                    ],
                    const CategoryTitle(),
                    ...[
                      state.categoryList.fold((l) {
                        return const SliverToBoxAdapter(
                          child: Text('خطا'),
                        );
                      },
                          (r) => state.hazineList.fold((l) {
                                return const SliverToBoxAdapter(
                                  child: Text('خطا'),
                                );
                              }, (r2) {
                                return CategotyList(r, r2);
                              }))
                    ],
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: 44, bottom: 17, top: 17),
                        child: Text(
                          'نمونه طرح توجیهی',
                          style: TextStyle(
                            fontFamily: 'iryknr',
                            color: CustomColors.gery,
                          ),
                        ),
                      ),
                    ),
                    ...[
                      state.productList.fold((l) {
                        return const SliverToBoxAdapter(
                          child: Text('خطا'),
                        );
                      }, (r) {
                        return TarhItemProduct(controller: controller, r);
                      })
                    ],
                    const SliverToBoxAdapter(
                      child: Divider(),
                    ),
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 44,
                          bottom: 17,
                          top: 17,
                        ),
                        child: Text(
                          'نمونه نقشه پلان جانمایی',
                          style: TextStyle(
                            fontFamily: 'iryknr',
                            color: CustomColors.gery,
                          ),
                        ),
                      ),
                    ),
                    ...[
                      state.planList.fold((l) {
                        return const SliverToBoxAdapter(
                          child: Text('خطا'),
                        );
                      }, (r) {
                        return Plan(controller: controller, r);
                      })
                    ],
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: Text('خطایی در دریافت اطلاعات به وجود آمده!'),
            );
          }
        },
      )),
    );
  }

  SizedBox loadingIndicator() {
    return const SizedBox(
      width: 34,
      height: 34,
      child: Center(
        child: LoadingIndicator(
            indicatorType: Indicator.ballRotateChase,
            colors: [CustomColors.blueIndicator],
            strokeWidth: 2,
            pathBackgroundColor: Colors.black),
      ),
    );
  }
}

class BarAvardHazine extends StatelessWidget {
  List<Product> _product;
  BarAvardHazine(
    this._product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) => (index == 0)
              ? Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: Center(
                    child: ProductItem(_product[index]),
                  ),
                )
              : ProductItem(_product[index])),
        ),
      ),
    );
  }
}

class TarhItemProduct extends StatelessWidget {
  List<Product> productList;
  TarhItemProduct(
    this.productList, {
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 220),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: ((context, index) => (index == 0)
              ? Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TarhProductItem(productList[index]),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [TarhProductItem(productList[index])],
                )),
        ),
      ),
    );
  }
}

class Plan extends StatelessWidget {
  List<Product> productList;
  Plan(
    this.productList, {
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        constraints: const BoxConstraints(maxHeight: 220),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productList.length,
          itemBuilder: ((context, index) => (index == 0)
              ? Padding(
                  padding: const EdgeInsets.only(right: 44),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TarhProductItem(productList[index]),
                      ],
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [TarhProductItem(productList[index])],
                )),
        ),
      ),
    );
  }
}

class CategotyList extends StatelessWidget {
  List<CategoryIMG> categoryList;
  List<Product> _product;
  CategotyList(
    this.categoryList,
    this._product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: 690,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Directionality(
                      textDirection: TextDirection.rtl,
                      child: Hazine(),
                    ),
                  ),
                );
              },
              child: CategoryChip(
                  'هزینه ساخت ساختمان و مسکونی', categoryList[0].thumbnail),
            ),
            GestureDetector(
              onTap: () {
                launchUrl(
                    Uri.parse(
                        'https://salinam.com/product-cat/هزینه%20ساخت%20و%20راه%20اندازی'),
                    mode: LaunchMode.inAppBrowserView);
              },
              child: CategoryChip('محاسبه هزینه ساخت و راه اندازی\n کسب و کار',
                  categoryList[1].thumbnail),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Directionality(
                          textDirection: TextDirection.rtl,
                          child: BlocProvider(
                            create: (context) => HomeBloc(),
                            child: NemooneTarh(),
                          ),
                        )));
              },
              child: CategoryChip(
                  'سفارش طرح توجیهی ، بیزینس پلن و\n طرح کسب و کار',
                  categoryList[6].thumbnail),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Directionality(
                          textDirection: TextDirection.rtl,
                          child: BlocProvider(
                            create: (context) => HomeBloc(),
                            child: NemooneNagshe(),
                          ),
                        )));
              },
              child: CategoryChip(
                  'سفارش نقشه سایت پلان ', categoryList[7].thumbnail),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: BlocProvider(
                          create: (context) => HomeBloc(),
                          child: TravelScreen(),
                        )),
                  ),
                );
              },
              child: CategoryChip(
                  'مسافرت , گردشگری , کار و اشتغال\n زندگی در کشور های اروپایی و خارجی',
                  categoryList[2].thumbnail),
            ),
            GestureDetector(
              onTap: () {
                launchUrl(
                    Uri.parse(
                        'https://salinam.com/product-cat/%D9%85%D8%A7%D8%B4%DB%8C%D9%86%20%D8%A2%D9%84%D8%A7%D8%AA%20%D8%AE%D8%B7%20%D8%AA%D9%88%D9%84%DB%8C%D8%AF'),
                    mode: LaunchMode.externalApplication);
              },
              child: CategoryChip(
                  'قیمت روز خط تولید و ماشین آلات\n سنگین و صنعتی',
                  categoryList[5].thumbnail),
            ),
            GestureDetector(
              onTap: () {
                launchUrl(
                    Uri.parse(
                        'https://salinam.com/product-cat/وام%20،%20تسهیلات%20،%20سرمایه%20گذاری'),
                    mode: LaunchMode.externalApplication);
              },
              child: CategoryChip(
                  'معرفی سرمایه گذاری های سودده و \n نحوه دریافت وام و تسهیلات دولتی',
                  categoryList[16].thumbnail),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                    create: (context) => HomeBloc(),
                    child: const VamScreen(),
                  ),
                ));
              },
              child: CategoryChip(
                  'اخبار وام و تسهیلات دولتی ', categoryList[17].thumbnail),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BlocProvider(
                    create: (context) => HomeBloc(),
                    child: const BankScreen(),
                  ),));
              },
              child: CategoryChip(
                  'تسهیلات اعلامی از سوی بانک ها', categoryList[18].thumbnail),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.fromLTRB(44, 20, 44, 20),
        child: Text(
          'دسته بندی خدمات سالینام',
          style: TextStyle(
            fontFamily: 'iryknr',
            color: CustomColors.gery,
          ),
        ),
      ),
    );
  }
}
