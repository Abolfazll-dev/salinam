import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salinam/Screens/DashboardScreen.dart';
import 'package:salinam/Screens/Links/SharayetEstefade.dart';
import 'package:salinam/Screens/LoginScreen.dart';
import 'package:salinam/bloc/Authentication/auth_bloc.dart';
import 'package:salinam/bloc/Authentication/auth_event.dart';
import 'package:salinam/bloc/Authentication/auth_state.dart';
import 'package:salinam/constants/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _userNameInputController = TextEditingController();
  final _passwordInputController = TextEditingController();
  final _passwordConfirmInputController = TextEditingController();
  final _nameInputController = TextEditingController();
  final _emailInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Salinam'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(0, 255, 255, 255),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: double.infinity,
                        height: 20,
                      ),
                      const Text(
                        'خوش آمدید 👋',
                        style: TextStyle(fontSize: 32, fontFamily: 'irykn'),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'برای ادامه ثبت نام کنید',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'iryknr',
                            color: CustomColors.gery),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'نام و نام خانوادگی',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'irykndb',
                            color: CustomColors.black),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        height: 65,
                        decoration: BoxDecoration(
                            color: CustomColors.containerColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 300,
                                height: 50,
                                child: TextField(
                                  controller: _nameInputController,
                                  keyboardType: TextInputType.name,
                                  decoration: const InputDecoration(
                                      hintText:
                                          'نام و نام خانوادگی خود را وارد کنید ...',
                                      hintStyle: TextStyle(
                                          color: CustomColors.gery,
                                          fontFamily: 'iryknr'),
                                      border: InputBorder.none),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SvgPicture.asset(
                                    'assets/images/Profile.svg'),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'ایمیل',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'irykndb',
                            color: CustomColors.black),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        height: 65,
                        decoration: BoxDecoration(
                            color: CustomColors.containerColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 300,
                                height: 50,
                                child: TextField(
                                  controller: _emailInputController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: const InputDecoration(
                                    hintText: 'ایمیل خود را وارد کنید ...',
                                    hintStyle: TextStyle(
                                      color: CustomColors.gery,
                                      fontFamily: 'iryknr',
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SvgPicture.asset(
                                  'assets/images/Message.svg',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      const Text(
                        'شماره همراه',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'irykndb',
                            color: CustomColors.black),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        height: 65,
                        decoration: BoxDecoration(
                            color: CustomColors.containerColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 280,
                                height: 50,
                                child: TextField(
                                  controller: _userNameInputController,
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                      hintText:
                                          'شماره همراه خود را وارد کنید ...',
                                      hintStyle: TextStyle(
                                          color: CustomColors.gery,
                                          fontFamily: 'iryknr'),
                                      border: InputBorder.none),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SvgPicture.asset(
                                    width: 24,
                                    height: 24,
                                    'assets/images/Call.svg'),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Text(
                        'رمز عبور',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'irykndb',
                          color: CustomColors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        height: 65,
                        decoration: BoxDecoration(
                            color: CustomColors.containerColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child:
                                    SvgPicture.asset('assets/images/Hide.svg'),
                              ),
                              SizedBox(
                                width: 250,
                                height: 50,
                                child: TextField(
                                  obscureText: true,
                                  controller: _passwordInputController,
                                  decoration: const InputDecoration(
                                      hintText: 'رمز عبور خود را وارد کنید ...',
                                      hintStyle: TextStyle(
                                          color: CustomColors.gery,
                                          fontFamily: 'iryknr'),
                                      border: InputBorder.none),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SvgPicture.asset(
                                  'assets/images/Group.svg',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Text(
                        'تکرار رمز عبور',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'irykndb',
                          color: CustomColors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.infinity,
                        height: 65,
                        decoration: BoxDecoration(
                            color: CustomColors.containerColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child:
                                    SvgPicture.asset('assets/images/Hide.svg'),
                              ),
                              SizedBox(
                                width: 250,
                                height: 50,
                                child: TextField(
                                  obscureText: true,
                                  controller: _passwordConfirmInputController,
                                  decoration: const InputDecoration(
                                      hintText: 'رمز عبور خود را وارد کنید ...',
                                      hintStyle: TextStyle(
                                          color: CustomColors.gery,
                                          fontFamily: 'iryknr'),
                                      border: InputBorder.none),
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: SvgPicture.asset(
                                  'assets/images/Group.svg',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'انتخاب گزینه ثبت نام به منزله پذیرفتن استفاده از',
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(fontFamily: 'irykndb', fontSize: 15),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context)=>Sharayet()));
                                },
                                child: const Text(
                                  '  خدمات و حریم شخصی ',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: CustomColors.blue,
                                      fontFamily: 'irykndb',
                                      fontSize: 15),
                                ),
                              ),
                              const Text(
                                'می باشد',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'irykndb', fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocConsumer<AuthBloc, AuthState>(
                            listener: (context, state) {
                              if (state is AuthResponseState) {
                                state.response.fold((l) {
                                  var sanckBar = SnackBar(
                                    content: Text(
                                      l,
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(sanckBar);
                                }, (r) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const DashboardScreen()));
                                });
                              }
                            },
                            builder: (context, state) {
                              if (state is AuthStateInit) {
                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: CustomColors.blue,
                                        minimumSize: const Size(200, 45)),
                                    onPressed: () {
                                      BlocProvider.of<AuthBloc>(context)
                                          .add(AuthRegisterRequest(
                                        _userNameInputController.text,
                                        _passwordInputController.text,
                                        _passwordConfirmInputController.text,
                                        _nameInputController.text,
                                        _emailInputController.text,
                                      ));
                                    },
                                    child: const Text(
                                      'ثبت نام',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontFamily: 'irykn'),
                                    ));
                              }
                              if (state is AuthStateLoading) {
                                return const CircularProgressIndicator();
                              }
                              if (state is AuthResponseState) {
                                Widget widget = const Text('');
                                state.response.fold(
                                  (l) {
                                    widget = ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: CustomColors.blue,
                                            minimumSize: const Size(200, 45)),
                                        onPressed: () {
                                          BlocProvider.of<AuthBloc>(context)
                                              .add(AuthRegisterRequest(
                                            _userNameInputController.text,
                                            _passwordInputController.text,
                                            _passwordConfirmInputController
                                                .text,
                                            _nameInputController.text,
                                            _emailInputController.text,
                                          ));
                                        },
                                        child: const Text(
                                          'ثبت نام',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontFamily: 'irykn'),
                                        ));
                                  },
                                  (r) {
                                    widget = Text(r);
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Text(
                                            'برای ورود دوباره کلیک کنید'));
                                  },
                                );
                                return widget;
                              }
                              return const Text('خطای ناشناخته !');
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 39,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
