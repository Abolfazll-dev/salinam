import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:salinam/Screens/DashboardScreen.dart';
import 'package:salinam/Screens/RegisterScreen.dart';
import 'package:salinam/bloc/Authentication/auth_bloc.dart';
import 'package:salinam/bloc/Authentication/auth_event.dart';
import 'package:salinam/bloc/Authentication/auth_state.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    bool obscureText = true;
    final userNameInputController = TextEditingController();
    final passwordInputController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustomColors.backgroundScreenColor,
        title: const Text('Salinam'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
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
                    ),
                    const Text(
                      'ورود 👋',
                      style: TextStyle(fontSize: 32, fontFamily: 'irykn'),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'برای ادامه وارد حساب کاربری خود شوید',
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
                                keyboardType: TextInputType.phone,
                                controller: userNameInputController,
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
                              child: SvgPicture.asset('assets/images/Call.svg'),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: GestureDetector(
                                onTap: () {},
                                child:
                                    SvgPicture.asset('assets/images/Hide.svg'),
                              ),
                            ),
                            SizedBox(
                              width: 250,
                              height: 50,
                              child: TextField(
                                obscureText: obscureText,
                                controller: passwordInputController,
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
                              child:
                                  SvgPicture.asset('assets/images/Group.svg'),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'از قبل اکانت ندارید؟',
                          style: TextStyle(
                              fontFamily: 'iryknr',
                              color: CustomColors.black,
                              fontSize: 18),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (context) {
                                        var authBloc = AuthBloc();
                                        authBloc.stream.forEach((state) {
                                          if (state is AuthResponseState) {
                                            state.response.fold((l) {}, (r) {
                                              globalNavigatorKey.currentState
                                                  ?.pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DashboardScreen(),
                                                ),
                                              );
                                            });
                                          }
                                        });
                                        return authBloc;
                                      },
                                      child: const RegisterScreen(),
                                    )));
                          },
                          child: const Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Text(
                              'ثبت نام',
                              style: TextStyle(
                                color: CustomColors.blue,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 12,
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
                                            DashboardScreen()));
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
                                    BlocProvider.of<AuthBloc>(context).add(
                                        AuthLoginRequest(
                                            passwordInputController.text,
                                            userNameInputController.text));
                                  },
                                  child: const Text(
                                    'ورود',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
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
                                        BlocProvider.of<AuthBloc>(context).add(
                                            AuthLoginRequest(
                                                passwordInputController.text,
                                                userNameInputController.text));
                                      },
                                      child: const Text(
                                        'ورود',
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
