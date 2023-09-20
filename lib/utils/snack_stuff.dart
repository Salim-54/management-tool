import 'package:flutter/material.dart';

import '../constants/colors.dart';

void showSnackbar(BuildContext context, String message, type) {
  var snackBar = SnackBar(
    duration: const Duration(seconds: 1),
    dismissDirection: DismissDirection.up,
    content: Text(message),
    backgroundColor: type == "success" ? AppColor.success : AppColor.error,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void snackDirect(
  BuildContext context,
  String message,
) {
  var snackBar = SnackBar(
    duration: const Duration(seconds: 1),
    dismissDirection: DismissDirection.up,
    content: Text(
      message,
      style: const TextStyle(color: AppColor.kInput),
    ),
    backgroundColor: AppColor.oBlue,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
