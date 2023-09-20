import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../screens/login/login.screen.dart';

class Constants {
  static const BASE_URL = "https://api.rdtech.ishema.rw/api/v1";
}

class Utils {
  static String numberFormat(int num) {
    if (num < 1000) return "$num";
    var formatter = NumberFormat('##,000');
    return formatter.format(num);
  }

  static String compactNumber(int num) {
    return NumberFormat.compact().format(num);
  }

  static void showSnackBar({
    required String title,
    required BuildContext context,
    Color color = Colors.red,
  }) {
    final snackBar = SnackBar(
      content: Text(title),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static String? validateMobile(String value) {
    String pattern = r'(^(07[8,2,3,9])[0-9]{7}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static void logout(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).logout();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        ModalRoute.withName("/login"));
  }

  static String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }
}
