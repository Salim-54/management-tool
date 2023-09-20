import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../models/request.model.dart';
import '../../../providers/request_provider.dart';
import 'request_row.dart';

class DeclinedList extends StatelessWidget {
  const DeclinedList({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: Provider.of<RequestProvider>(context, listen: false)
              .fetchAndSave(),
          builder: (context, snapshot) {
            List<Request> requests =
                Provider.of<RequestProvider>(context, listen: false).items;
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  return RequestRow(
                    request: requests[index],
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
        Positioned(
            bottom: 15,
            right: 0,
            child: InkWell(
              onTap: onPressed,
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  color: AppColor.pBlue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF125070).withOpacity(0.25),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            )),
      ],
    );
  }
}
