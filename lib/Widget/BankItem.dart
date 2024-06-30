import 'package:flutter/material.dart';
import 'package:salinam/Screens/Links/NewsScreen.dart';
import 'package:salinam/Widget/Cached_image.dart';
import 'package:salinam/data/moudels/Bank.dart';
import 'package:salinam/data/moudels/News.dart';
import 'package:url_launcher/url_launcher.dart';

class BankItem extends StatelessWidget {
  List<Bank> _bank;
  BankItem(this._bank, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -120,
      width: double.infinity,
      child: ListView.builder(itemCount: _bank.length,itemBuilder: (context, index) {
        
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 44, vertical: 10),
            child: GestureDetector(
              onTap: () {
                launchUrl(
                    Uri.parse(
                        _bank[index].link,),
                    mode: LaunchMode.inAppBrowserView);
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
                      margin: EdgeInsets.only(right: 10, left: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedImge(
                          imageUrl: _bank[index].image,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 70,
                      child: Text(
                        _bank[index].title,
                        style: TextStyle(fontFamily: 'iryknr', fontSize: 12),
                        textAlign: TextAlign.justify,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
