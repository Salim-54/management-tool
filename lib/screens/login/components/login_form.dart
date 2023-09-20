import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:management_tool/screens/homepage/home.screen.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/auth_provider.dart';
import '../../../utils/constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isLoading = false;
  bool _obscureText = true;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  Future<void> _submitForm() async {
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });
    print("🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥🔥");

    try {
      showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      await Provider.of<AuthProvider>(context, listen: false)
          .login(_emailController.text, _passwordController.text);
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(
      //         builder: (BuildContext context) => DashboardScreen()),
      //     ModalRoute.withName("/dashboard"));


      Navigator.pop(context);

      var route = PageRouteBuilder(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const HomeScreen();
        },
        transitionDuration: const Duration(milliseconds: 500),
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      );
      Navigator.of(context).push(route);
    } on HttpException catch (err) {
      Navigator.pop(context);
      
      Utils.showSnackBar(title: err.message, context: context);
      return;
    } catch (err) {
      Navigator.pop(context);
      if (kDebugMode) {
        print(err);
      }
      Utils.showSnackBar(title: err.toString(), context: context);
    } finally {
      // Navigator.pop(context);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  color: AppColor.blackTitle,
                  fontSize: 24,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Email Address",
                style: TextStyle(
                  color: AppColor.pBlue,
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'example@gmail.com',
                  hintStyle: TextStyle(
                    color: AppColor.sPlaceholder,
                    fontSize: 14,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w300,
                  ),
                  // set border size
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "Password",
                style: TextStyle(
                  color: AppColor.pBlue,
                  fontSize: 14,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                child: TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    hintText: '**************',
                    hintStyle: const TextStyle(
                      color: AppColor.sPlaceholder,
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w300,
                    ),
                    border: InputBorder.none,
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: 70,
                      // minHeight: 40,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: AppColor.pBlue,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF1A74E2)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
