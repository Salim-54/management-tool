import 'package:flutter/material.dart';
import 'package:management_tool/providers/item_provider.dart';
import 'package:provider/provider.dart';

import '../../../components/search.dart';
import '../../../constants/colors.dart';
import 'float.dart';
import 'item_row.dart';
import 'tab_buttons.dart';

class Details extends StatelessWidget {
  final VoidCallback goItems;
  final VoidCallback goSale;
  final VoidCallback goLeasing;
  const Details({
    Key? key,
    required this.goSale,
    required this.goLeasing,
    required this.goItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemsProvider>(
      builder: (context, value, child) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Consumer<ItemsProvider>(
                  builder: (context, value, child) {
                    return SearchWidget(
                      textEditingController: value.dSearchController,
                      onChanged: value.onDSearchChanged,
                    );
                  },
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: goItems,
                  child: const Text(
                    'ITEMS',
                    style: TextStyle(
                      color: AppColor.sText,
                      fontSize: 14,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const DetailRow(),
                const SizedBox(height: 50),
                SaleButton(
                  onPressed: goSale,
                ),
                const SizedBox(height: 20),
                SaleButton(
                  color: const Color(0xFF1957A4),
                  name: "LEASING",
                  onPressed: goLeasing,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
