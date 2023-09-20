import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/search.dart';
import '../../../constants/colors.dart';
import '../../../providers/request_provider.dart';
import 'accepted_list.dart';
import 'approved_list.dart';
import 'pending_list.dart';
import 'tab_buttons.dart';

class Body extends StatelessWidget {
  final VoidCallback onPressed;
  const Body({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Consumer<RequestProvider>(
              builder: (context, value, child) {
                return SearchWidget(
                  textEditingController: value.searchController,
                  onChanged: value.onSearchChanged,
                );
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'REQUESTS',
              style: TextStyle(
                color: AppColor.sText,
                fontSize: 14,
                fontFamily: "Inter",
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            const TabButtons(),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<RequestProvider>(
                  builder: (context, value, child) {
                    if (value.selectedTab == value.tabs[0]) {
                      return PendingList(onPressed: onPressed);
                    } else if (value.selectedTab == value.tabs[1]) {
                      return AcceptedList(onPressed: onPressed);
                    } else if (value.selectedTab == value.tabs[2]) {
                      return DeclinedList(onPressed: onPressed);
                    } else {
                      return PendingList(onPressed: onPressed);
                    }
                  },
                  child: PendingList(onPressed: onPressed)),
            ),
          ],
        ),
      ),
    );
  }
}



