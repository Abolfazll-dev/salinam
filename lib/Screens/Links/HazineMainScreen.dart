import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salinam/Widget/productItem.dart';

import 'package:salinam/bloc/Home/Home_Bloc.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/data/moudels/product.dart';

class HazineMainScreen extends StatefulWidget {
    List<Product> product;
  HazineMainScreen(this.product,{super.key});

  @override
  State<HazineMainScreen> createState() => _HazineMainScreenState();
}

class _HazineMainScreenState extends State<HazineMainScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundScreenColor,
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
             
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(44, 20, 44, 80),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.14,
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 5),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => ProductItem(widget.product[index]),//ProductItem(),
                      childCount: widget.product.length,
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
