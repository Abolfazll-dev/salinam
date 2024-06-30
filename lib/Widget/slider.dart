import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salinam/Screens/Links/ContactUs.dart';
import 'package:salinam/Screens/Links/Sefaresh.dart';
import 'package:salinam/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class SliderMenu extends StatefulWidget {
  const SliderMenu({super.key});

  @override
  State<SliderMenu> createState() => _SliderMenuState();
}

class _SliderMenuState extends State<SliderMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: CustomColors.backgroundColor2),
        child: Padding(
          padding: const EdgeInsets.only(right: 44),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 32, right: 44),
                child: Text(
                  'سالینام',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              InkWell(
                                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ContactUs()));
                },
                child: Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(top: 40),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/ProfileScreen.svg',
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'درباره ما',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 200, child: Divider()),
              InkWell(
                                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SefareshScreen()));
                },
                child: Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/note.svg',
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'سفارش طرح توجیهی',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 200, child: Divider()),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SefareshScreen()));
                },
                child: Container(
                  width: 200,
                  height: 40,
                  margin: const EdgeInsets.only(top: 5),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/note.svg',
                        color: Colors.white,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Text(
                          'سفارش نقشه پلان جانمایی',
                          style: TextStyle(color: Colors.white,fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(width: 200, child: Divider()),
              const Spacer(),
              Container(
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
