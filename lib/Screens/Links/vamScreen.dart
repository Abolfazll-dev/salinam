import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:salinam/Widget/VamItem.dart';
import 'package:salinam/bloc/Home/Home_Bloc.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/bloc/Home/Home_State.dart';
import 'package:salinam/constants/colors.dart';

class VamScreen extends StatefulWidget {
  const VamScreen({super.key});

  @override
  State<VamScreen> createState() => _VamScreenState();
}

class _VamScreenState extends State<VamScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salinam'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
        if (state is HomeLoadingState) {
          return Center(
            child: loadingIndicator(),
          );
        } else if (state is HomeRequestSuccessState) {
          return CustomScrollView(
            reverse: false,
            slivers: [
              ...[
                state.news.fold((ifLeft) {
                  return const SliverToBoxAdapter(
                    child: Text('خطا'),
                  );
                }, (ifRight) {
                  return SliverToBoxAdapter(
                    child: VamItem(ifRight),
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
