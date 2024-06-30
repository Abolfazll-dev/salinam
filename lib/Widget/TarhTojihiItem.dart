import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:salinam/Widget/Cached_image.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/data/moudels/product.dart';
import 'package:url_launcher/url_launcher.dart';

class TarhProductItem extends StatefulWidget {
  Product product;
  TarhProductItem(this.product, {super.key});

  @override
  State<TarhProductItem> createState() => _TarhProductItemState();
}


class _TarhProductItemState extends State<TarhProductItem> {
  double downloadedValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 304,
            height: 170,
            margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, blurRadius: 20, spreadRadius: -16)
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(26, 12, 145, 0),
                  child: Text(
                    widget.product.title,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                        fontSize: 12,
                        color: CustomColors.black,
                        fontFamily: 'iryknr'),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(113, 37)),
                        onPressed: () {},
                        child: const Text(
                          'رایگان !',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'iryknr',
                              fontSize: 11),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      OutlinedButton(
                        onPressed: () async {
                           launchUrl(Uri.parse(widget.product.file),
                                  mode: LaunchMode.externalApplication);
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(113, 37),
                          side: const BorderSide(
                              width: 1, color: CustomColors.blue),
                        ),
                        child: const Row(
                          children: [
                            Text(
                              'دانلود',
                              style: TextStyle(
                                  color: CustomColors.blue, fontSize: 10),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20),
            width: 113,
            height: 113,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedImge(
                  imageUrl: widget.product.image,
                )),
          )
        ],
      ),
    );
  }


}
