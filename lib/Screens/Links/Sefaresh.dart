// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:salinam/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SefareshScreen extends StatefulWidget {
  const SefareshScreen({super.key});

  @override
  State<SefareshScreen> createState() => _SefareshScreenState();
}

class _SefareshScreenState extends State<SefareshScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundScreenColor,
        title: Text('Salinam'),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xffeeeeee),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 44),
                    child: Column(
                      children: [
                        Text(
                                'جهت انجام سفارشات طرح توجیهی , بیزینس پلن و طرح کسب و کار با نرم افزار کامفار و طراحی نقشه سایت پلان صنعتی با شماره زیر تماس بگیرید :',
                                textAlign: TextAlign.center,
                                
                                style: TextStyle(
                                  height: 2.5,
                                    fontFamily: 'irykndb', color: CustomColors.red),
                              ),
                              SizedBox(height: 30,),
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
                )
              ],
            ),
          ],
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

// ignore: must_be_immutable
class _GetItem extends StatelessWidget {
  _GetItem();

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {},
        child: getProductInBasket());
  }

  Container getProductInBasket() {
    return Container(
      height: 239,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 44, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    const SizedBox(
                      width: 160,
                      child: Text(
                        'Test',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16, fontFamily: 'sb'),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'گارانتی 18 ماه مدیا پردازش',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'SM',
                          color: CustomColors.gery),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      children: [
                        Text(
                          'تومان',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'SM',
                              color: CustomColors.gery),
                        ),
                        Text(
                          '۴۶٬۰۰۰٬۰۰۰',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: 'SM',
                              color: CustomColors.gery),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 60,
                            height: 26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                                border: Border.all(
                                  color: CustomColors.red,
                                )),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    'حذف',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'sm',
                                        color: CustomColors.red),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                    width: 100,
                    height: 100,
                    child: FittedBox(child: Container())),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: List.generate(
              150 ~/ 2,
              (index) => Expanded(
                child: Container(
                  color: index % 2 == 0
                      ? Colors.transparent
                      : const Color.fromARGB(255, 208, 208, 208),
                  height: 2,
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 80,
              ),
              const Text(
                'تومان',
                style: TextStyle(
                    fontSize: 16, fontFamily: 'SM', color: Colors.black),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                '676676'.seRagham(),
                style: const TextStyle(
                    fontSize: 16, fontFamily: 'SM', color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String? _extractValueFromQuery(String url, String key) {
  int queryStartIndex = url.indexOf('?');
  if (queryStartIndex == -1) return null;

  String query = url.substring(queryStartIndex + 1);

  List<String> pairs = query.split('&');

  for (String pair in pairs) {
    List<String> keyValue = pair.split('=');
    if (keyValue.length == 2) {
      String currentKey = keyValue[0];
      String value = keyValue[1];

      if (currentKey == key) {
        return Uri.decodeComponent(value);
      }
    }
  }
  return null;
}
