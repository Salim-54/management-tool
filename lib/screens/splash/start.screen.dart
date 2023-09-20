import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:management_tool/screens/login/login.screen.dart';

import '../../constants/colors.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: double.infinity,
                alignment: Alignment.center,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: Image.asset(
                  'assets/images/logo_splash.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 40,
                child: SizedBox(
                  width: 210,
                  height: 71,
                  child: TextButton(
                      onPressed: () {
                        print('object');
                        var route = PageRouteBuilder(
                          pageBuilder: (BuildContext context,
                              Animation<double> animation,
                              Animation<double> secondaryAnimation) {
                            return const LoginScreen();
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
                      },
                      child: MaterialButton(
                        color: AppColor.pBlue,
                        onPressed: () {
                          var route = PageRouteBuilder(
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) {
                              return const LoginScreen();
                            },
                            transitionDuration:
                                const Duration(milliseconds: 500),
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
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(55),
                          side: const BorderSide(
                            color: Color(0xFF1E569A),
                            width: 5,
                          ),
                        ),
                        child: Ink(
                          // decoration:
                          //     const BoxDecoration(color: AppColor.sBlue),
                          child: Container(
                            constraints: const BoxConstraints(minHeight: 15),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'NEXT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  child: SvgPicture.asset(
                                    'assets/icons/arrow.svg',
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
