import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:salinam/Screens/HomeScreen.dart';
import 'package:salinam/Widget/Fade.dart';
import 'package:salinam/Widget/NemooneTarhItem.dart';
import 'package:salinam/Widget/TarhTojihiItem.dart';
import 'package:salinam/bloc/Home/Home_Bloc.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/bloc/Home/Home_State.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/data/moudels/product.dart';
import 'package:url_launcher/url_launcher.dart';

class NemooneTarh extends StatefulWidget {
  NemooneTarh({super.key});

  @override
  State<NemooneTarh> createState() => _NemooneTarhState();
}

class _NemooneTarhState extends State<NemooneTarh> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundScreenColor,
      appBar: AppBar(
        title: Text('Salinam'),
        centerTitle: true,
        backgroundColor: CustomColors.backgroundScreenColor,
      ),
      body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoadingState) {
          return Center(
            child: loadingIndicator(),
          );
        } else if (state is HomeRequestSuccessState) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44, vertical: 0),
                  child: Column(
                    children: [
                      Text(
                        'نمونه طرح توجیهی و بیزینس پلن و طرح و کسب و کار و طرح توجیهی با نرم افزار کامفار',
                        style: TextStyle(
                          color: CustomColors.gery,
                          fontFamily: 'irykndb',
                        ),
                      ),
                      Text(
                              'جهت انجام سفارشات طرح توجیهی , بیزینس پلن و طرح کسب و کار با نرم افزار کامفار با شماره زیر تماس بگیرید :',
                              textAlign: TextAlign.center,
                              
                              style: TextStyle(
                                height: 2,
                                  fontFamily: 'irykndb', color: CustomColors.red),
                            ),
                    ],
                  ),
                  
                ),
              ),
              if (state is HomeLoadingState) ...{
                const SliverToBoxAdapter(
                  child: CircularProgressIndicator(),
                )
              },
              if (state is HomeRequestSuccessState) ...{
                state.productList.fold((l) {
                  return const SliverToBoxAdapter(
                    child: Text('خطا'),
                  );
                }, (r) {
                  return SliverToBoxAdapter(child: getList(r));
                })
              },
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 44,),
                sliver: SliverToBoxAdapter(
                  child: Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20),
                          width: 220,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 62, 175, 255),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: SvgPicture.asset(
                                  'assets/images/Call.svg',
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 25,
                              ),
                              GestureDetector(
                                onTap: () {
                                  dialNumber(
                                      context: context, phoneNumber: '09103071134');
                                },
                                child: Text(
                                  '09103071134',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                ),
              )
            ],
          );
        } else {
          return const Text('خطا');
        }
      })),
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
  Future<void> dialNumber(
      {required String phoneNumber, required BuildContext context}) async {
    final url = "tel:$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('خطا');
    }

    return;
  }
class getList extends StatelessWidget {
  final List<Product> _product;
  getList(
    this._product, {
    super.key,
  });
  var controller = PageController(viewportFraction: 0.38);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ListView.builder(
              itemCount: _product.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TarhProductItem(
                    _product[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
