import 'package:flutter/material.dart';
import 'package:management_tool/models/client.model.dart';
import 'package:management_tool/providers/client_provide.dart';
import 'package:provider/provider.dart';

import '../../../components/buttons.dart';
import 'client_row.dart';

class Detail extends StatelessWidget {
  final VoidCallback goList;
  final String id;

  const Detail({
    Key? key,
    required this.goList,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Client client =
        Provider.of<ClientsProvider>(context, listen: false).findById(id);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            DetailRow(
              name: client.name,
              office: client.office,
              phone: client.phone,
            ),
            const SizedBox(height: 50),
            GlobalButton(
              onPressed: goList,
              text: 'Request',
            ),
          ],
        ),
      ),
    );
  }
}
