import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salinam/Screens/Links/CalculateScreen.dart';
import 'package:salinam/bloc/Home/Home_Bloc.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/data/moudels/product.dart';

class ProductItem extends StatelessWidget {
  Product _product;
  ProductItem(this._product, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Directionality(
                textDirection: TextDirection.rtl,
                child: BlocProvider(
                  create: (context) => HomeBloc(),
                  child: CalculateScreen(_product),
                )),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 10),
        width: 165,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: -8),
            ],
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: SizedBox(
                width: 150,
                height: 40,
                child: Text(
                  _product.title,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                      color: CustomColors.black,
                      fontSize: 12,
                      fontFamily: 'irykndb'),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'مشاهده',
                  style: TextStyle(color: CustomColors.blue, fontSize: 10),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(113, 37),
                  side: const BorderSide(width: 1, color: CustomColors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
