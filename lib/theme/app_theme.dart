import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';

ThemeData theme() {
  return ThemeData(
    buttonTheme: const ButtonThemeData(
      minWidth: double.infinity,
      padding: EdgeInsets.all(2),
    ),
    // elevatedButtonTheme: ,

    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Inter",
    textTheme: themeText(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: bottomNavigationBarTheme(),
  );
}

BottomNavigationBarThemeData bottomNavigationBarTheme() {
  return const BottomNavigationBarThemeData(
    // backgroundColor: AppColor.pGrey,

    selectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: "Inter",
      color: AppColor.pBlue,
      height: 2,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: AppColor.pGrey,
    ),
    // showSelectedLabels: true,
    // showUnselectedLabels: true,
    type: BottomNavigationBarType.fixed,
  );
}


InputDecorationTheme inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(width: 2, color: AppColor.borderBlue),
    gapPadding: 10,
  );

  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorBorder: outlineInputBorder,
    focusedErrorBorder: outlineInputBorder,
  );
}

InputDecorationTheme inputDecorationTheme2() {
  var outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.borderBlue,
      width: 3,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorBorder: outlineInputBorder,
    focusedErrorBorder: outlineInputBorder,
  );
}

InputDecorationTheme inputDecorationTheme3() {
  var outlineInputBorder = const OutlineInputBorder(
    borderSide: BorderSide(
      color: AppColor.borderBlue,
      width: 3,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );

  return InputDecorationTheme(
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    errorBorder: outlineInputBorder,
    focusedErrorBorder: outlineInputBorder,
  );
}





TextTheme themeText() {
  return const TextTheme(
    bodyText1: TextStyle(color: AppColor.pText),
    bodyText2: TextStyle(color: AppColor.sText),
  );
}

/**
 * InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        filled: true,
        fillColor: Color(0xFFFAFCFE),

        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: "Inter",
          fontSize: 15,
          color: Color(0xFF9F9F9F),
          fontWeight: FontWeight.w500,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(25)),
        // ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderBlue,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderBlue,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderBlue,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.borderBlue,
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      )
 */