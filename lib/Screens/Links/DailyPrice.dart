import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:salinam/bloc/Home/Home_Bloc.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/bloc/Home/Home_State.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/data/moudels/DailyPriceMoudel.dart';

class DailyPrice extends StatefulWidget {
  const DailyPrice({super.key});

  @override
  State<DailyPrice> createState() => _DailyPriceState();
}

class _DailyPriceState extends State<DailyPrice> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              ...[
                state.dailyPrice.fold((ifLeft) {
                  return const SliverToBoxAdapter(
                    child: Text('error'),
                  );
                }, (r) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: r.length,
                          itemBuilder: (context, index) => GetItem(r[index])),
                    ),
                  );
                })
              ]
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

class GetItem extends StatelessWidget {
  DailyPrice2 dailyPrice;
  GetItem(
    this.dailyPrice, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
      margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.white),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(dailyPrice.title),
                const SizedBox(
                  height: 10,
                ),
                const Text('قیمت :'),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      Text(
                        dailyPrice.price.toString().seRagham(),
                        style:
                            const TextStyle(color: CustomColors.blue, fontSize: 10),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'ریالء',
                        style:
                            TextStyle(color: CustomColors.blue, fontSize: 10),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(113, 37),
                    side: const BorderSide(width: 1, color: CustomColors.blue),
                  ),
                ),
                const Text('کارکرد :'),
                const SizedBox(height: 10,),
                OutlinedButton(
                  onPressed: () {},
                  child:  Row(
                    children: [
                      Text(
                        (dailyPrice.karKard.isEmpty)?'کارکردی ثبت نشده است': dailyPrice.karKard,
                        style:
                            const TextStyle(color: CustomColors.blue, fontSize: 10),
                      ),
                      
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                    minimumSize: const Size(113, 37),
                    side: const BorderSide(width: 1, color: CustomColors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
