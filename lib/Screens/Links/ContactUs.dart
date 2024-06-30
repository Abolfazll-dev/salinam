import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salinam/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salinam'),
        centerTitle: true,
        backgroundColor: CustomColors.backgroundScreenColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(44, 20, 44, 20),
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.black,
                              blurRadius: 20,
                              spreadRadius: -20)
                        ],
                      ),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'درباره ما',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: CustomColors.blue,
                                  fontFamily: 'iryknr',
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 44),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'مجموعه سالینام',
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'در این مجموعه خدماتی راجع به سرمایه گذاری را با موارد زیر انجام میدهیم',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'محاسبه هزینه های ساخت مسکونی بصورت آنلاین بر اساس نیاز مشتری بصورت رایگان',
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'محاسبه هزینه ساخت و راه اندازی کسب و کار',
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'ارائه قیمت و فاکتور خط تولید و ماشین آلات صنعتی',
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'انجام سفارشات طراحی نقشه سایت پلان جانمایی صنعتی',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'انجام سفارشات برآورد مالی پروژه د طرح توجیهی ، بیزینس پلن ، طرح کسب و کار با نرم افزار کامفار جهت اخذ وام و مجوز از ادارات و موسسات و جهت سرمایه گذاری',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'ارائه خدماتو اطلاعات سرمایه گذاری و سرمایه گذاری های سودده',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'ارائه خدمات اخبار وام و تسهیلات اعلامی از سوی بانکها و دولت و نحوه دریافت وام و تسهیلات جهت راه اندازی و تجهیز کسب و کار',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'ارائه راهنمایی خدمات مسافرت و گردشگری',
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontFamily: 'irykndb'),
                          ),
                          Text(''),
                          Text(
                            'جهت انجام سفارشات طرح توجیهی , بیزینس پلن و طرح کسب و کار با نرم افزار کامفار و طراحی نقشه سایت پلان صنعتی با شماره زیر تماس بگیرید :',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'irykndb', color: CustomColors.red),
                          ),
                          Text(''),
                          Text(''),
                          Text(''),
                          Text(''),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 220,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 62, 175, 255),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: SvgPicture.asset(
                            'assets/images/Call.svg',
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            dialNumber(
                                context: context, phoneNumber: '09103071134');
                          },
                          child: Text(
                            '09103071134',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> dialNumber(
      {required String phoneNumber, required BuildContext context}) async {
    final url = "tel:$phoneNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('خطا');
    }

    return;
  }
}
