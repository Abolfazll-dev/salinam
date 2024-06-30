import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salinam/Screens/DashboardScreen.dart';
import 'package:salinam/Screens/Links/ContactUs.dart';
import 'package:salinam/Screens/Links/SharayetEstefade.dart';
import 'package:salinam/Screens/LoginScreen.dart';
import 'package:salinam/Utill/Auth_manager.dart';
import 'package:salinam/Widget/CategoryItem.dart';
import 'package:salinam/bloc/Authentication/auth_bloc.dart';
import 'package:salinam/bloc/Authentication/auth_state.dart';
import 'package:salinam/constants/colors.dart';
import 'package:salinam/main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(44, 20, 44, 0),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black, blurRadius: 20, spreadRadius: -20)
                  ],
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        'حساب کاربری',
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
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => ContactUs()));
                  },
                  child: CategoryItem(CustomColors.blue, 'درباره ما','assets/images/Profile.svg'),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Sharayet()));
                  },
                  child: CategoryItem(CustomColors.blue, 'قوانین حریم خصوصی','assets/images/security.svg'),
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            const Spacer(),
            const Text(
              'سالینام',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'iryknr', color: CustomColors.gery),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'V-1.0.0.1',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'iryknr', color: CustomColors.gery),
            ),
            const Text(
              'www.salinam.com',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'iryknr', color: CustomColors.gery),
            ),
            const Text(
              'www.tarh-tojihi.com',
              style: TextStyle(
                  fontSize: 12, fontFamily: 'iryknr', color: CustomColors.gery),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                AuthManager.logOut();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BlocProvider(
                    create: (context) {
                      var authBloc = AuthBloc();
                      authBloc.stream.forEach((state) {
                        if (state is AuthResponseState) {
                          state.response.fold((l) {}, (r) {
                            globalNavigatorKey.currentState?.pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const DashboardScreen(),
                              ),
                            );
                          });
                        }
                      });
                      return authBloc;
                    },
                    child: const LoginScreen(),
                  );
                }));
              },
              child: const Text(
                'خروج',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
