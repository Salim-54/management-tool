import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../utils/avatar_name.dart';

class ClientRow extends StatelessWidget {
  final VoidCallback goDetail;
  final String name;
  final String phone;
  final String office;
  const ClientRow({
    Key? key,
    required this.goDetail,
    required this.name,
    required this.phone,
    required this.office,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: goDetail,
      child: Padding(
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
                    getAbbreviation(name),
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
                          name,
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
                          office,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: AppColor.pText,
                          ),
                        ),
                        Text(
                          phone,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                            color: AppColor.pText,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SvgPicture.asset(
                  'assets/icons/forward.svg',
                  width: 9.62,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailRow extends StatelessWidget {
  final String name;
  final String phone;
  final String office;
  
  const DetailRow({
    Key? key,
    required this.name,
    required this.phone,
    required this.office,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
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
              getAbbreviation(name),
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
                    name,
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
                    office,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: AppColor.pText,
                    ),
                  ),
                  Text(
                    phone,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w300,
                      color: AppColor.pText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
