import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../providers/functionality_provider.dart';
import '../../../providers/request_provider.dart';

class TabButtons extends StatefulWidget {
  const TabButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<TabButtons> createState() => _TabButtonsState();
}

class _TabButtonsState extends State<TabButtons> {

  @override
  Widget build(BuildContext context) {
    return Consumer<FunctionalityProvider>(
      builder: (context, value, child) {
        return Row(
          children: [
            SizedBox(
              width: 100,
              height: 28,
              child: ElevatedButton(
                onPressed: () {
                  value.selectTab(value.tabs[0]);
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: value.selectedTab == "" ||
                          value.tabs[0] == value.selectedTab
                      ? MaterialStateProperty.all<Color>(
                          const Color(0xFF1A74E2))
                      : MaterialStateProperty.all<Color>(
                          const Color(0xFFFFFFFF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                child: Text(
                  'Pending',
                  style: TextStyle(
                    color: value.selectedTab == "" ||
                            value.tabs[0] == value.selectedTab
                        ? Colors.white
                        : AppColor.sText,
                    fontSize: 14,
                    fontFamily: "Roboto",
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
                  value.selectTab(value.tabs[1]);
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: value.tabs[1] == value.selectedTab
                      ? MaterialStateProperty.all<Color>(
                          const Color(0xFF1A74E2))
                      : MaterialStateProperty.all<Color>(
                          const Color(0xFFFFFFFF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                child: Text(
                  'Accepted',
                  style: TextStyle(
                    color: value.tabs[1] ==
                            Provider.of<FunctionalityProvider>(context,
                                    listen: false)
                                .selectedTab
                        ? Colors.white
                        : AppColor.sText,
                    fontSize: 14,
                    fontFamily: "Roboto",
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
                  value.selectTab(value.tabs[2]);
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: value.tabs[2] == value.selectedTab
                      ? MaterialStateProperty.all<Color>(
                          const Color(0xFF1A74E2))
                      : MaterialStateProperty.all<Color>(
                          const Color(0xFFFFFFFF)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                child: Text(
                  'Declined',
                  style: TextStyle(
                    color: value.tabs[2] ==
                            Provider.of<FunctionalityProvider>(context,
                                    listen: false)
                                .selectedTab
                        ? Colors.white
                        : AppColor.sText,
                    fontSize: 14,
                    fontFamily: "Roboto",
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
