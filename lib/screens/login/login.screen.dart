import 'package:flutter/material.dart';
import 'package:management_tool/constants/colors.dart';

import 'components/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          // height is equal to the height of the screen
          // height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.48,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF1A74E2),
                        Color(0xFF089EF6),
                      ],
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 30),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'Welcome to ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'RD',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontFamily: "Inter",
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'TECH',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: "Inter",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Sign in to Continue ',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Color(0xFFCFCCCC),
                                fontSize: 20,
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // circle
                      Positioned(
                        top: -120,
                        left: -70,
                        child: Container(
                          width: 244,
                          height: 244,
                          decoration: const BoxDecoration(
                            color: AppColor.oBlue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: -100,
                        right: -70,
                        child: Container(
                          width: 244,
                          height: 244,
                          decoration: const BoxDecoration(
                            color: AppColor.oBlue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.488,
                  child: const LoginForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
