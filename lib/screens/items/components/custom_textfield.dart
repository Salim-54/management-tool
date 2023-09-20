import 'package:flutter/material.dart';
import 'package:management_tool/theme/app_theme.dart';

import '../../../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChange;
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: inputDecorationTheme2(),
      ),
      child: TextField(
        onChanged: onChange,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.placeText,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class NumberTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChange;
  const NumberTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: inputDecorationTheme2(),
      ),
      child: TextField(
        onChanged: onChange,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.placeText,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class MultiLinesTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final void Function(String) onChange;
  const MultiLinesTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: inputDecorationTheme2(),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChange,
        
        minLines: 4,
        maxLines: 4,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: AppColor.placeText,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
