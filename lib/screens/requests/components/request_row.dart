import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../models/request.model.dart';
import '../../../utils/avatar_name.dart';
import '../../../utils/date_formatter.dart';

class RequestRow extends StatelessWidget {
  final Request request;
  const RequestRow({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: Alignment.center,
                // make it circle
                width: 63,
                height: 63,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColor.sBlue,
                ),
                child: Text(
                  getAbbreviation(request.name),
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        request.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                          color: AppColor.pText,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        request.reason,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: AppColor.pText,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        dateFormatter(request.date),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          color: AppColor.pText,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: 10,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
