import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salinam/Widget/Cached_image.dart';
import 'package:url_launcher/url_launcher.dart';

class TravelChip extends StatelessWidget {
  String name;
  String imageUrl;
  String link;
  TravelChip(this.name, this.imageUrl, this.link, {super.key});

  @override
  Widget build(BuildContext context) {
    return TravelChipItem(context);
  }

  Widget TravelChipItem(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
        },
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                const BoxShadow(
                    color: Colors.black, blurRadius: 20, spreadRadius: -20)
              ]),
          child: Row(
            children: [
              SizedBox(
                width: 55,
                height: 55,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: CachedImge(imageUrl: imageUrl),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                name,
                style: const TextStyle(fontFamily: 'irykndb', fontSize: 12),
              ),
              const Spacer(),
              SvgPicture.asset('assets/images/Group 65.svg'),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
