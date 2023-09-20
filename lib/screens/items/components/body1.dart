import 'package:flutter/material.dart';
import 'package:management_tool/models/item.model.dart';
import 'package:provider/provider.dart';

import '../../../components/search.dart';
import '../../../constants/colors.dart';
import '../../../providers/item_provider.dart';
import 'float.dart';
import 'item_row.dart';
import 'tab_buttons.dart';

class BodyOne extends StatelessWidget {
  final VoidCallback goDetail;
  final Function onPressed;
  const BodyOne({
    Key? key,
    required this.onPressed,
    required this.goDetail,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
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
                  textEditingController: value.searchController,
                  onChanged: value.onSearchChanged,
                );
              },
            ),
            // child: SearchWidget()),
            const SizedBox(height: 20),
            const Text(
              'ITEMS',
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
              child: Consumer<ItemsProvider>(
                builder: (context, value, child) {
                  if (value.tab == value.tabs[0]) {
                    return AvailableList(
                        goDetail: goDetail, onPressed: onPressed);
                  }
                  return UsedList(goDetail: goDetail, onPressed: onPressed);
                },
                child: SizedBox(
                    child: AvailableList(
                        goDetail: goDetail, onPressed: onPressed)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AvailableList extends StatelessWidget {
  const AvailableList({
    Key? key,
    required this.goDetail,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback goDetail;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future:
              Provider.of<ItemsProvider>(context, listen: false).fetchAndSave(),
          builder: (context, snapshot) {
            List<Item> items = Provider.of<ItemsProvider>(context).items;
            if (snapshot.connectionState == ConnectionState.done) {
             

              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemRow(
                    item: items[index],
                    goDetail: goDetail,
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Positioned(
          bottom: 20,
          right: 0,
          child: ReturnButton(
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}

class UsedList extends StatelessWidget {
  const UsedList({
    Key? key,
    required this.goDetail,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback goDetail;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future:
              Provider.of<ItemsProvider>(context, listen: false).fetchAndSave(),
          builder: (context, snapshot) {
            List<Item> items = Provider.of<ItemsProvider>(context).items;
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ItemRow(
                    item: items[index],
                    goDetail: goDetail,
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Positioned(
          bottom: 20,
          right: 0,
          child: ReturnButton(
            onPressed: onPressed,
          ),
        )
      ],
    );
  }
}
