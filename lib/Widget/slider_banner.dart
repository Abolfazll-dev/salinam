
import 'package:flutter/material.dart';
import 'package:salinam/Widget/Cached_image.dart';
import 'package:salinam/data/moudels/Banner.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlideBanner extends StatelessWidget {
List<BannerCampain> bannerList;
  SlideBanner(
    this.bannerList,
    {
    super.key,
  });

  var controller = PageController(viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: controller,
            itemCount: bannerList.length,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedImge(imageUrl: bannerList[index].thumbnail,)
                )
              );
            }),
          ),
        ),
        Positioned(
          bottom: 10,
          child: SmoothPageIndicator(
            controller: controller,
            count: bannerList.length,
            effect: const ExpandingDotsEffect(
                dotHeight: 5,
                dotWidth: 5,
                dotColor: Colors.white,
                expansionFactor: 4),
          ),
        )
      ],
    );
  }
}
