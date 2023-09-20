import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/search.dart';
import '../../../providers/client_provide.dart';
import 'client_row.dart';

class BodyOne extends StatelessWidget {
  final VoidCallback goDetail;
  final Function(String) setDetail;
  const BodyOne({
    Key? key,
    required this.goDetail,
    required this.setDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Consumer<ClientsProvider>(
              builder: (context, value, child) {
                return SearchWidget(
                  textEditingController: value.searchController,
                  onChanged: value.onSearchChanged,
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Consumer<ClientsProvider>(
                builder: (context, value, child) {
                  return FutureBuilder(
                    future: value.fetchAndSave(),

                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Consumer<ClientsProvider>(
                        builder: (context, value, child) {
                          return ListView.builder(
                            itemCount: value.items.length,
                            itemBuilder: (context, index) {
                              return ClientRow(
                                name: value.items[index].name,
                                office: value.items[index].office,
                                phone: value.items[index].phone,
                                key: Key(value.items[index].id),
                                goDetail: () {
                                  setDetail(value.items[index].id);
                                  goDetail();
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
                // child:,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
