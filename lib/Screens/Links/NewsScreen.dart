import 'package:flutter/material.dart';
import 'package:salinam/Widget/Cached_image.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/data/moudels/News.dart';

class NewsScreen extends StatelessWidget {
  News news;
  NewsScreen(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Salinam'),
        centerTitle: true,
        backgroundColor: CustomColors.backgroundScreenColor,
      ),
      body: SafeArea(
          child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 44),
              child: FittedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: CachedImge(
                    imageUrl: news.image,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 44, vertical: 20),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    news.title,
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontFamily: 'irykndb',
                      fontSize: 11
                    ),
                  ),
                )),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                children: [
                  Center(child: Text('توضیحات بیشتر')),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 44, vertical: 20),
                    child: Center(
                      child: Text(
                        news.news,
                        style: TextStyle(height: 1.8),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
