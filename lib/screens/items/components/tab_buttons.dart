import 'package:flutter/material.dart';
import 'package:management_tool/providers/item_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';

class TabButtons extends StatelessWidget {
  const TabButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(
      builder: (context, value, child) {
        return Row(
          children: [
            SizedBox(
              width: 100,
              height: 28,
              child: ElevatedButton(
                onPressed: () {
     
                  value.setTab(value.tabs[0]);
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: value.tab == "" || value.tabs[0] == value.tab
                      ? MaterialStateProperty.all<Color>(
                          const Color(0xFF1A74E2))
                      : MaterialStateProperty.all<Color>(
                          const Color(0xFFFFFFFF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: Color(0xFF1A74E2),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                child: Text(
                  'Available',
                  style: TextStyle(
                    color: value.tab == "" || value.tabs[0] == value.tab
                        ? Colors.white
                        : AppColor.pBlue,
                    fontSize: 15,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: 100,
              height: 28,
              child: ElevatedButton(
                onPressed: () {
                  value.setTab(value.tabs[1]);
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: value.tabs[1] == value.tab
                      ? MaterialStateProperty.all<Color>(
                          const Color(0xFF1A74E2))
                      : MaterialStateProperty.all<Color>(
                          const Color(0xFFFFFFFF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(
                        color: Color(0xFF1A74E2),
                        width: 2,
                      ),
                    ),
                  ),
                ),
                child: Text(
                  'Used',
                  style: TextStyle(
                    color: value.tabs[1] == value.tab
                        ? Colors.white
                        : AppColor.pBlue,
                    fontSize: 15,
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
