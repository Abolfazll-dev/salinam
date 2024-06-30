import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salinam/Screens/Links/CalculateScreen.dart';
import 'package:salinam/constants/colors.dart';

class NemooneTarhItem extends StatelessWidget {
  const NemooneTarhItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: Container(), //CalculateScreen(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 15, top: 10),
        width: 165,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              const BoxShadow(
                  color: Colors.black, blurRadius: 10, spreadRadius: -8),
            ],
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset('assets/images/p.png')),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
              child: Text(
                'برآورد هزینه مرغداری',
                style: TextStyle(
                    color: CustomColors.black,
                    fontSize: 12,
                    fontFamily: 'irykndb'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(
                  'رایگان !',
                  style: TextStyle(color: CustomColors.blue, fontSize: 10),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(113, 37),
                  side: const BorderSide(width: 1, color: CustomColors.blue),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  
                },
                child: const Text(
                  'دانلود',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(113, 37),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
