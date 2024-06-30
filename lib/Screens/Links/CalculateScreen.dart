import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salinam/Widget/Cached_image.dart';
import 'package:salinam/bloc/Home/Home_Bloc.dart';
import 'package:salinam/bloc/Home/Home_Event.dart';
import 'package:salinam/bloc/Home/Home_State.dart';
import 'package:salinam/constants/colors.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:salinam/data/moudels/product.dart';

class CalculateScreen extends StatefulWidget {
  Product _product;
  CalculateScreen(this._product, {super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeGetInitData());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String zamin = widget._product.zamin!.toString();
    String mahvate = widget._product.mahvate!.toString();
    String yakhteman = widget._product.yakhteman!.toString();
    String machinery = widget._product.machinery!.toString();
    String tasisat = widget._product.tasisat!.toString();
    String vehicles = widget._product.vehicles!.toString();
    String preoperationalCosts =
        widget._product.preoperationalCosts!.toString();
    String administrativeCosts =
        widget._product.administrativeCosts!.toString();
    String personnel = widget._product.personnel!.toString();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: SafeArea(child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Directionality(
                textDirection: TextDirection.rtl,
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: double.infinity,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              right: 44,
                              bottom: 17,
                              top: 17,
                            ),
                            child: Text(
                              'موضوع',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'iryknr',
                                color: CustomColors.gery,
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            margin: const EdgeInsets.symmetric(horizontal: 44),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color.fromARGB(255, 245, 245, 245),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  widget._product.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: CustomColors.black,
                                    fontFamily: 'irykndb',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          (widget._product.image == '')? const Text('data'):Container(
                            width: double.infinity,
                            height: 160,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 44, vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:
                                  CachedImge(imageUrl: widget._product.image),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 44,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'مقدار زمین مورد نیاز',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'iryknr',
                                        color: CustomColors.gery,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        16, 10, 44, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            zamin.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'مربع\n متر',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 16,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'هزینه محوطه سازی',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'iryknr',
                                        color: CustomColors.gery,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        44, 10, 16, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            mahvate.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'میلیون\n ریالء',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 44,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'یاختمان سازی',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'iryknr',
                                        color: CustomColors.gery,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        16, 10, 44, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            yakhteman.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'میلیون\n ریالء',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 16,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'ماشین آلات و تجهیزات مورد نیاز',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontFamily: 'iryknr',
                                          color: CustomColors.gery,
                                          fontSize: 12),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        44, 10, 16, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            machinery.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'میلیون\n ریالء',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 44,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'تاسیسات',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'iryknr',
                                        color: CustomColors.gery,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        16, 10, 44, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            tasisat.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'میلیون\n ریالء',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 16,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'وسایل نقلیه',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'iryknr',
                                        color: CustomColors.gery,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        44, 10, 16, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            vehicles.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'میلیون\n ریالء',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 44,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'هزینه های قبل از بهره برداری ',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontFamily: 'iryknr',
                                          color: CustomColors.gery,
                                          fontSize: 11),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        16, 10, 44, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            preoperationalCosts.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'میلیون\n ریالء',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 16,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'هزینه های اداری',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'iryknr',
                                        color: CustomColors.gery,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        44, 10, 16, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            administrativeCosts.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'میلیون\n ریالء',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      right: 44,
                                      bottom: 10,
                                      top: 12,
                                    ),
                                    child: Text(
                                      'تعداد پرسنل مورد نیاز',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'iryknr',
                                        color: CustomColors.gery,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 145,
                                    height: 44,
                                    margin: const EdgeInsets.fromLTRB(
                                        16, 10, 44, 10),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffFAFAFA),
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: const [
                                          BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 20,
                                              spreadRadius: -14)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Text(
                                            personnel.seRagham(),
                                            style:
                                                const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        const VerticalDivider(),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 8),
                                          child: Text(
                                            'نفر',
                                            style: TextStyle(
                                                color: CustomColors.gery,
                                                fontSize: 10,
                                                fontFamily: 'irykndb'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 44, top: 10),
                                    child: SizedBox(
                                      width: 300,
                                      child: Text(
                                        'جمع کل ${widget._product.title}',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: CustomColors.gery,
                                          fontSize: 14,
                                          fontFamily: 'irykndb',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 15),
                        height: 58,
                        decoration: BoxDecoration(
                            color: CustomColors.blue,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${int.parse(mahvate) + int.parse(yakhteman) + int.parse(machinery) + int.parse(tasisat) + int.parse(vehicles) + int.parse(preoperationalCosts) + int.parse(administrativeCosts) * 10000000}'
                                    .seRagham(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'irykndb',
                                    fontSize: 16),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'ریالء',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'irykndb',
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          },
        )));
  }
}
