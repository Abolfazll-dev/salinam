import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:salinam/Screens/HomeScreen.dart';
import 'package:salinam/Screens/Links/BankScreen.dart';
import 'package:salinam/Screens/Links/DailyPrice.dart';
import 'package:salinam/Screens/Links/Hazine.dart';
import 'package:salinam/Screens/Links/HazineMainScreen.dart';
import 'package:salinam/Screens/Links/NemooneNagshePlan.dart';
import 'package:salinam/Screens/Links/NemooneTarh.dart';
import 'package:salinam/Screens/Links/TravelScreen.dart';
import 'package:salinam/Screens/Links/vamScreen.dart';
import 'package:salinam/Widget/Cached_image.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/bloc/Home/Home_State.dart';
import 'package:salinam/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bloc/Home/Home_Bloc.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundScreenColor,
        title: const Text(
          'دسته بندی',
          style: TextStyle(fontFamily: 'irykndb'),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (state is HomeRequestSuccessState) {
              return CustomScrollView(
                slivers: [
                  ...[
                    state.category.fold((l) {
                      return const SliverToBoxAdapter(
                        child: Text('خطا'),
                      );
                    }, (r) {
                      return SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Hazine(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 30, right: 34, left: 10),
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedImge(
                                          imageUrl: r[0].thumbnail,
                                        )),
                                  ),
                                ),
                                if (state is HomeRequestSuccessState) ...{
                                  state.hazineList.fold((l) {
                                    return Text('خطا');
                                  }, (r2) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: HazineMainScreen(r2),
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            top: 30, left: 34, right: 10),
                                        width: 160,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: CachedImge(
                                              imageUrl: r[1].thumbnail,
                                            )),
                                      ),
                                    );
                                  })
                                }
                              ],
                            ),
                            Row(
                              children: [
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
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, right: 34, left: 10),
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedImge(
                                          imageUrl: r[2].thumbnail,
                                        )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    launchUrl(
                                        Uri.parse(
                                            'https://salinam.com/product-cat/%D9%85%D8%A7%D8%B4%DB%8C%D9%86%20%D8%A2%D9%84%D8%A7%D8%AA%20%D8%AE%D8%B7%20%D8%AA%D9%88%D9%84%DB%8C%D8%AF'),
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 20, left: 34, right: 10),
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedImge(
                                          imageUrl: r[5].thumbnail,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: BlocProvider(
                                              create: (context) => HomeBloc(),
                                              child: NemooneTarh(),
                                            )),
                                      ),
                                    );
                                  },
                                  child: GestureDetector(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, right: 34, left: 10),
                                      width: 160,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: CachedImge(
                                            imageUrl: r[6].thumbnail,
                                          )),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: BlocProvider(
                                              create: (context) => HomeBloc(),
                                              child: NemooneNagshe(),
                                            )),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                      left: 34,
                                      right: 10,
                                    ),
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedImge(
                                          imageUrl: r[7].thumbnail,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: BlocProvider(
                                              create: (context) => HomeBloc(),
                                              child: NemooneTarh(),
                                            )),
                                      ),
                                    );
                                  },
                                  child: GestureDetector(
                                    onTap: () {
                                      launchUrl(
                                          Uri.parse(
                                              'https://salinam.com/product-cat/%D9%85%D8%A7%D8%B4%DB%8C%D9%86%20%D8%A2%D9%84%D8%A7%D8%AA%20%D8%AE%D8%B7%20%D8%AA%D9%88%D9%84%DB%8C%D8%AF'),
                                          mode: LaunchMode.externalApplication);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, right: 34, left: 10),
                                      width: 160,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: CachedImge(
                                            imageUrl: r[8].thumbnail,
                                          )),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: BlocProvider(
                                              create: (context) => HomeBloc(),
                                              child: VamScreen(),
                                            )),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                      left: 34,
                                      right: 10,
                                    ),
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: CachedImge(
                                          imageUrl: r[9].thumbnail,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Directionality(
                                            textDirection: TextDirection.rtl,
                                            child: BlocProvider(
                                              create: (context) => HomeBloc(),
                                              child: BankScreen(),
                                            )),
                                      ),
                                    );
                                  },
                                  child: GestureDetector(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          top: 20, right: 34, left: 10),
                                      width: 160,
                                      height: 160,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: CachedImge(
                                            imageUrl: r[10].thumbnail,
                                          )),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    })
                  ]
                ],
              );
            } else {
              return const Center(
                child: Text('خطایی در دریافت اطلاعات به وجود آمده!'),
              );
            }
          },
        ),
      ),
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
