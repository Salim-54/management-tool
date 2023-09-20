import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/app_theme.dart';

class MyDropdownSearch extends StatelessWidget {
  final String placeholder;
  final String? selectedValue;
  final Function(String) onChanged;
  final Function(String) onSaved;
  final List<String> list;
  const MyDropdownSearch(
      {super.key,
      required this.placeholder,
      required this.list,
      required this.onChanged,
      required this.onSaved,
      required this.selectedValue});

  // String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: inputDecorationTheme3(),
      ),
      child: SizedBox(
        height: 60,
        child: DropdownButtonFormField2(
          isExpanded: true,
          hint: Text(
            placeholder,
            style: const TextStyle(fontSize: 14),
          ),
          items: list
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (value == null) {
              return 'Please select item.';
            }
            return null;
          },
          onChanged: (value) {
            //Do something when changing the item if you want.
            onChanged(value.toString());
          },
          onSaved: (value) {
            // selectedValue = value.toString();
            onSaved(value.toString());
          },
          buttonStyleData: const ButtonStyleData(
            height: 60,
            padding: EdgeInsets.only(left: 20, right: 10),
            // width: 100,
          ),
          iconStyleData: IconStyleData(
            icon: SvgPicture.asset('assets/icons/down.svg'),
            iconSize: 30,
          ),

          customButton: Container(
            height: 58,
            // color: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            // color: Colors.red,
            alignment: Alignment.center,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    selectedValue ?? placeholder,
                    style: const TextStyle(
                      color: Color(0xFF6F6E6E),
                      fontFamily: 'Inter',
                      fontSize: 14,
                    ),
                  ),
                ),
                SvgPicture.asset('assets/icons/down.svg', height: 7.69),
              ],
            ),
          ),
          // customise the dropdown menu

          dropdownStyleData: DropdownStyleData(
            elevation: 1,
            width: 250,
            maxHeight: 200,
            direction: DropdownDirection.left,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}
