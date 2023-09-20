import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String> onChanged;
  const SearchWidget({
    Key? key,
    required this.textEditingController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      autofocus: false,
      obscureText: false,
      onChanged: onChanged,
      // onChanged: (value) => setState(() {
      //   txn.email.value = value;
      // }),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 12,
        ),
        filled: true,
        fillColor: Color(0xFFE4EEFC),
        prefixIcon: Icon(
          Icons.search,
          color: AppColor.pBlue,
          size: 20,
        ),
        hintText: 'Search Client...',
        hintStyle: TextStyle(
          fontFamily: "Inter",
          fontSize: 11,
          color: Color(0xFF9F9F9F),
          fontWeight: FontWeight.w400,
        ),
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.all(Radius.circular(25)),
        // ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
      ),
      style: const TextStyle(
        fontSize: 14,
      ),
    );
  }
}
