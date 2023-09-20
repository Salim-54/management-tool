import 'dart:async';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../homepage/home.screen.dart';
import 'start.screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                Hero(
                  tag: "logo-image",
                  child: SizedBox(
                    width: 200,
                    child: Image.asset(
                      "assets/images/logo_splash.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Text(
                    "Copyright Ⓒ RDTech 2023",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[800]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void startTimer() {
    // print("Start timer");
    Timer(const Duration(seconds: 3), () {
      navigateUser();
    });
  }

  Future<void> navigateUser() async {
    Provider.of<AuthProvider>(context, listen: false)
        .tryAutoLogin()
        .then((value) async {
      final isAuth = Provider.of<AuthProvider>(context, listen: false).isAuth;
      if (isAuth) {
        var route = PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const HomeScreen();
          },
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
        Navigator.of(context).push(route);
      } else {
        var route = PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const StartPage();
          },
          transitionDuration: const Duration(milliseconds: 500),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
        Navigator.of(context).push(route);
      }
    });
  }
}
