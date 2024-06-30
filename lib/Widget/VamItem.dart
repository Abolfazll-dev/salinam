import 'package:flutter/material.dart';
import 'package:salinam/Screens/Links/NewsScreen.dart';
import 'package:salinam/Widget/Cached_image.dart';
import 'package:salinam/data/moudels/News.dart';

class VamItem extends StatelessWidget {
  List<News> _news;
  VamItem(this._news, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 120,
      width: double.infinity,
      child: ListView.builder(
        itemCount: _news.length,
        itemBuilder: (context, index) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NewsScreen(_news[index]),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(right: 10, left: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CachedImge(
                            imageUrl: _news[index].image,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 170,
                        height: 70,
                        child: Text(
                          _news[index].title,
                          style: const TextStyle(fontFamily: 'iryknr', fontSize: 12),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
