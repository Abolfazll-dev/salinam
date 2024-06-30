import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:salinam/Screens/HomeScreen.dart';
import 'package:salinam/Widget/Category.dart';
import 'package:salinam/Widget/TravelItems.dart';
import 'package:salinam/bloc/Home/Home_Bloc.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/bloc/Home/Home_State.dart';
import 'package:salinam/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TravelScreen extends StatefulWidget {
  TravelScreen({super.key});

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('salinam'),
        centerTitle: true,
        backgroundColor: CustomColors.backgroundScreenColor,
      ),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoadingState) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (state is HomeRequestSuccessState) {
              return Column(
                children: [
                  ...[
                    state.travel.fold((ifLeft) {
                      return const Text('خطا');
                    }, (ifRight) {
                      return SizedBox(
                        width: double.infinity,
                        height: 700,
                        child: ListView.builder(
                          itemCount: ifRight.length,
                          itemBuilder: (context, index) {
                             return TravelChip(ifRight[index].name, ifRight[index].image,
                                ifRight[index].link);
                          },
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
