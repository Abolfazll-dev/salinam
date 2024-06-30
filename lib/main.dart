import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:salinam/Screens/DashboardScreen.dart';

import 'package:salinam/Screens/LoginScreen.dart';

import 'package:salinam/Utill/Auth_manager.dart';

import 'package:salinam/bloc/Authentication/auth_bloc.dart';
import 'package:salinam/bloc/Authentication/auth_state.dart';

import 'package:salinam/constants/colors.dart';
import 'package:salinam/di/di.dart';

GlobalKey<NavigatorState> globalNavigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getItInit();
  runApp(
    const Salinam(),
  );
}

class Salinam extends StatefulWidget {
  const Salinam({super.key});

  @override
  State<Salinam> createState() => _SalinamState();
}

class _SalinamState extends State<Salinam> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  int _getIndexNumber = 3;
  bool isSlide = false;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: CustomColors.backgroundScreenColor,
        fontFamily: 'irykn',
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.blue,
            minimumSize: const Size(342, 58),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: globalNavigatorKey,
      home: (AuthManager.readAuth().isEmpty)
          ? BlocProvider(
              create: ((context) {
                var authBloc = AuthBloc();
                authBloc.stream.forEach((state) {
                  if (state is AuthResponseState) {
                    state.response.fold((l) {
                    }, (r) {
                      globalNavigatorKey.currentState?.pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const DashboardScreen(),
                        ),
                      );
                    });
                  }
                });
                return authBloc;
              }),
              child: const LoginScreen(),
            )
          : const DashboardScreen(),
    );
  }
}
