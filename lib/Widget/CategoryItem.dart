import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salinam/constants/colors.dart';

class CategoryItem extends StatelessWidget {
  String name;
  Color color;
  String icon;
  CategoryItem(this.color,this.name,this.icon,{super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: ShapeDecoration(
                color: color,
                shadows: [
                  BoxShadow(
                      color: color,
                      blurRadius: 20,
                      spreadRadius: -6,
                      offset: const Offset(0.0, 10))
                ],
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: Center(
                  child: SvgPicture.asset(
                icon,
                color: Colors.white,
              )),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(fontFamily: 'irykndb', fontSize: 12),
        )
      ],
    );
  }
}
